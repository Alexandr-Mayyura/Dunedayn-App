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
    
    
// create tableview
    private let tableview: UITableView = {
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
    
    func addContetnt(){
        
        EventSetup.asyncRequest(URLs().orgUrl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: OrganizerBase) in
            self?.organizers = [result]
            EventSetup.asyncRequest(URLs().eventURl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader) { [weak self] (result: EventBase) in
                self?.calendarEvents = [result]
                self?.tableview.reloadData()
            }
        }
    }
    
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
    
    func editContent(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let actionEdit = UIContextualAction(style: .destructive, title: "Edit") { _, _, _ in
            let dates = String()
            let vc = AddEventViewController()
            let ev = self.calendarEvents
            let org = self.organizers
            vc.nameGameTextfield.text = ev[indexPath.section].records?[indexPath.row].name ?? ""
            vc.infoTextview.text = ev[indexPath.section].records?[indexPath.row].info ?? ""
            vc.dateGameTextfield.text = dates.datesFormated(data: (ev[indexPath.section].records?[indexPath.row].date)!)
            
            let organ = self.organizers[indexPath.section]
            guard let itemId = (ev[indexPath.section].records?[indexPath.row].organizerId) else { return }
            var neededItem = Int()
            for (index, item) in organ.records!.enumerated() {
                if item.id == itemId {
                    neededItem = index
                }
            }
            vc.organizerTextfield.text = org[indexPath.section].records?[neededItem].name
            vc.id = ev[indexPath.section].records?[indexPath.row].id
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        actionEdit.backgroundColor = .orange
        return actionEdit
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        addContetnt()
      
        tableviewFrame()
        
        tableview.reloadData()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .gray
        
        self.title = "Календарь"
        
// add button to navigationController
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector (rightButtonAction))
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
       
        view.backgroundColor = .gray
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

        let organ = organizers[indexPath.section]

        guard let itemId = (event.records?[indexPath.row].organizerId) else { return UITableViewCell()}

        var neededItem = Int()
        
        for (index, item) in organ.records!.enumerated() {
            if item.id == itemId {
                neededItem = index
            }
        }
        
        cell.nameLabel?.text = "\(event.records?[indexPath.row].name ?? "") \n\(organ.records?[neededItem].name ?? "") "

        cell.backgroundColor = .gray
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
        vc.type = ev.records?[indexPath.row].type
        vc.info = ev.records?[indexPath.row].info
        vc.date = ev.records?[indexPath.row].date
        
        let organ = organizers[indexPath.section]
        guard let itemId = (ev.records?[indexPath.row].organizerId) else { return }
        var neededItem = Int()
        for (index, item) in organ.records!.enumerated() {
            if item.id == itemId {
                neededItem = index
            }
        }
        vc.organazerName = organ.records?[neededItem].name
        
        navigationController?.pushViewController(vc, animated: true)        
    }
}

extension CalendarViewController {
    func tableviewFrame() {
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
        
            tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension String {
    func datesFormated(data: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let data = dateFormatter.date(from: data)!
        dateFormatter.dateFormat = "d MMMM YYYY"
        dateFormatter.locale = .init(identifier: "ru_RU_POSIX")
        
        let dateForm = dateFormatter.string(from: data)
        return dateForm
    }
}
