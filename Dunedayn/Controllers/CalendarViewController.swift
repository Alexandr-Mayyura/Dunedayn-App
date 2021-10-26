//
//  CalendarViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class CalendarViewController: UIViewController {
       
    var calendarEvents = EventBase()
    var evetns = [Events]()
    var organizers = OrganizerBase()
    var type = TypeBase()
    
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
            self?.organizers = result
                EventSetup.asyncRequest(URLs().typeURL, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: TypeBase) in
                    self?.type = result
                    EventSetup.asyncRequest(URLs().eventURl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader) { [weak self] (result: EventBase) in
                        self?.calendarEvents = result
                        RealmManager.sharedInstance.deleteAll()
                        RealmManager.sharedInstance.save(object: self!.organizers)
                        RealmManager.sharedInstance.save(object: self!.calendarEvents)
                        RealmManager.sharedInstance.save(object: self!.type)
        
                    self?.tableview.reloadData()
                }
            }
        }
    }
    
    // delete content in tableview and server
    func deleteContent(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        
        let actionDelet = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            let calendar = RealmManager.sharedInstance.get(object: self.calendarEvents)
            let id = calendar[indexPath.section].records[indexPath.row].id
            let link = "\(URLs().deleteURL)\(String(describing: id) + "/")"
            
            EventSetup.asyncRequest(link, method: .delete, parameters: nil, header: EventSetup.GetDeleteHeader) { (result: Events) in
            }
            RealmManager.sharedInstance.delete(object: self.calendarEvents.records[indexPath.row])
            self.tableview.deleteRows(at: [indexPath], with: .automatic)
        }
        return actionDelet
    }
    
    // transition for AddEventViewController and edit content in tableview and server
    func editContent(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let actionEdit = UIContextualAction(style: .destructive, title: "Edit") { _, _, _ in
          
            let vc = AddEventViewController()
            let calendar = RealmManager.sharedInstance.get(object: self.calendarEvents)
            let ev = calendar[indexPath.section].records 
            vc.nameGameTextfield.text = ev[indexPath.row].name
            vc.infoTextview.text = ev[indexPath.row].info
            vc.dateGameTextfield.text = ev[indexPath.row].date
            vc.type = ev[indexPath.row].typeId
            vc.organizer = ev[indexPath.row].organizerId
            
            let organ = RealmManager.sharedInstance.get(object: self.organizers)[indexPath.section].records
            let itemId = ev[indexPath.row].organizerId
            var neededItem = Int()
            for (index, item) in organ.enumerated() {
                if item.id == itemId {
                    neededItem = index
                }
            }
            vc.organizerTextfield.text = organ[neededItem].name

            let types = RealmManager.sharedInstance.get(object: self.type)[indexPath.section].records
            let typeId = ev[indexPath.row].typeId
            var neededType = Int()
            for (index, item) in types.enumerated() {
                if item.id == typeId {
                    neededType = index
                    }
                }
            vc.typeTextfield.text = types[neededType].type
            vc.id = ev[indexPath.row].id

            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        actionEdit.backgroundColor = .orange
        return actionEdit
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableviewFrame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
        addContetnt()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
        return RealmManager.sharedInstance.get(object: self.calendarEvents).count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return RealmManager.sharedInstance.get(object: self.calendarEvents)[section].records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarTableViewCell
        
        let event = RealmManager.sharedInstance.get(object: self.calendarEvents)[indexPath.section]

        cell.nameLabel?.text = "\(event.records[indexPath.row].name)"
        let dates = String()
        cell.dateLabel?.text = dates.datesFormatedInString(data: event.records[indexPath.row].date)
    
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
        let calendar = RealmManager.sharedInstance.get(object: self.calendarEvents)
        let ev = calendar[indexPath.section].records
        vc.name = ev[indexPath.row].name
        vc.info = ev[indexPath.row].info
        let dates = String()
        vc.date = dates.datesFormatedInString(data: ev[indexPath.row].date)

        let organ = RealmManager.sharedInstance.get(object: self.organizers)[indexPath.section].records
        let itemId = ev[indexPath.row].organizerId
        var neededItem = Int()
        for (index, item) in organ.enumerated() {
            if item.id == itemId {
                neededItem = index
            }
        }
        vc.organazerName = organ[neededItem].name
        
        let types = RealmManager.sharedInstance.get(object: self.type)[indexPath.section].records
        let typeId = ev[indexPath.row].typeId
        var neededType = Int()
        for (index, item) in types.enumerated() {
            if item.id == typeId {
                neededType = index
            }
        }
        vc.type = types[neededType].type
        navigationController?.pushViewController(vc, animated: true)
    }
}




