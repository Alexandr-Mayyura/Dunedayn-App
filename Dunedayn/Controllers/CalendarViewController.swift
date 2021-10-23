//
//  CalendarViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class CalendarViewController: UIViewController {
       
    var calendarEvents = [EventBase]()
    var evetns = [Events]()
    var organizers = [OrganizerBase]()
    var type = [TypeBase]()
    
    var delegate: AddEventViewController?
    
// create tableview
     let tableview: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(CalendarTableViewCell.self, forCellReuseIdentifier: "calendarCell")
        return tv
    }()
        
// transition to AddEventViewController
    @objc func rightButtonAction(sender: UIBarButtonItem){
        
        let vc = AddEventViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // load data from server (dunedayn.ru)
    func addContetnt(){
        
        EventSetup.asyncRequest(URLs().orgUrl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: OrganizerBase) in
            self?.organizers = [result]
            EventSetup.asyncRequest(URLs().eventURl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader) { [weak self] (result: EventBase) in
                self?.calendarEvents = [result]
                EventSetup.asyncRequest(URLs().typeURL, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: TypeBase) in
                    self?.type = [result]
                    self?.tableview.reloadData()
                }
            }
        }
    }
    
    // delete content in tableview and server
    func deleteContent(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        
        let actionDelet = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            
            let id = self.calendarEvents[indexPath.section].records?[indexPath.row].id
            let link = "\(URLs().deleteURL)\(String(describing: id!) + "/")"
            
            EventSetup.asyncRequest(link, method: .delete, parameters: nil, header: EventSetup.GetDeleteHeader) { (result: Events) in
            }
            self.calendarEvents[indexPath.section].records?.remove(at: indexPath.row)
            self.tableview.deleteRows(at: [indexPath], with: .automatic)
        }
        return actionDelet
    }
    
    // transition for AddEventViewController and edit content in tableview and server
    func editContent(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let actionEdit = UIContextualAction(style: .destructive, title: "Edit") { _, _, _ in
          
            let vc = AddEventViewController()
            let ev = self.calendarEvents
            vc.nameGameTextfield.text = ev[indexPath.section].records?[indexPath.row].name ?? ""
            vc.infoTextview.text = ev[indexPath.section].records?[indexPath.row].info ?? ""
            vc.dateGameTextfield.text = ev[indexPath.section].records?[indexPath.row].date
            vc.type = ev[indexPath.section].records?[indexPath.row].typeId
            vc.organizer = ev[indexPath.section].records?[indexPath.row].organizerId
            
            let organ = self.organizers[indexPath.section]
            guard let itemId = (ev[indexPath.section].records?[indexPath.row].organizerId) else { return }
            var neededItem = Int()
            for (index, item) in organ.records!.enumerated() {
                if item.id == itemId {
                    neededItem = index
                }
            }
            vc.organizerTextfield.text = self.organizers[indexPath.section].records?[neededItem].name

            let types = self.type[indexPath.section]
            guard let typeId = (ev[indexPath.section].records?[indexPath.row].typeId) else { return }
            var neededType = Int()
            for (index, item) in types.records!.enumerated() {
                if item.id == typeId {
                    neededType = index
                    }
                }
            vc.typeTextfield.text = self.type[indexPath.section].records?[neededType].type
            vc.id = ev[indexPath.section].records?[indexPath.row].id

            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        actionEdit.backgroundColor = .orange
        return actionEdit
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
        addContetnt()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableviewFrame()

        tableview.dataSource = self
        tableview.delegate = self
      
// add button to navigationController
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector (rightButtonAction))
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return calendarEvents.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return calendarEvents[section].records?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarTableViewCell
        
        let event = calendarEvents[indexPath.section]

        cell.nameLabel?.text = "\(event.records?[indexPath.row].name ?? "")"
        let dates = String()
        cell.dateLabel?.text = dates.datesFormated(data: event.records?[indexPath.row].date ?? "2021-10-10")
    
        cell.backgroundColor = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.85)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let delete = self.deleteContent(rowIndexPathAt: indexPath)
        let edit = self.editContent(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = EventsViewController()
        let ev = calendarEvents[indexPath.section]
        vc.name = ev.records?[indexPath.row].name 
        vc.info = ev.records?[indexPath.row].info
        let dates = String()
        vc.date = dates.datesFormated(data: ev.records?[indexPath.row].date ?? "2021-10-10")

        let organ = organizers[indexPath.section]
        guard let itemId = (ev.records?[indexPath.row].organizerId) else { return }
        var neededItem = Int()
        for (index, item) in organ.records!.enumerated() {
            if item.id == itemId {
                neededItem = index
            }
        }
        vc.organazerName = organ.records?[neededItem].name
        
        let types = type[indexPath.section]
        guard let typeId = (ev.records?[indexPath.row].typeId) else { return }
        var neededType = Int()
        for (index, item) in types.records!.enumerated() {
            if item.id == typeId {
                neededType = index
            }
        }
        vc.type = types.records?[neededType].type

        navigationController?.pushViewController(vc, animated: true)        
    }
}




