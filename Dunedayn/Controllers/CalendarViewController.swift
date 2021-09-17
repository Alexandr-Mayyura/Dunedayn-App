//
//  CalendarViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

protocol reloadData {
    func reload(complition: EventSetup) -> ()
}

class CalendarViewController: UIViewController, reloadData {
    
    func reload(complition: EventSetup) {
        EventSetup.asyncGetPostRequest(URLs().eventURl, method: .get, parameters: nil, header: ["Content-Type": "application/json"]) { (result: [EventBase]) in
            self.calendarEvents = result
            self.tableview.reloadData()
        }
    }
    
    
    var calendarEvents = [EventBase]()
// create tableview
    private let tableview: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.register(CalendarTableViewCell.self, forCellReuseIdentifier: "calendarCell")
        return tv
    }()
    
// add frame for tableview
    func tableviewFrame() {
        tableview.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
// transition to AddEventViewController
    @objc func rightButtonAction(sender: UIBarButtonItem){
        
        let vc = AddEventViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func reloadData(){
        self.tableview.reloadData()
    }

    func addContetnt(){
        
 
        EventSetup.asyncGetPostRequest(URLs().eventURl, method: .get, parameters: nil, header: ["Offset": "0", "Count": "100"]) { [weak self] (result: EventBase) in
            self?.calendarEvents = [result]
            self?.tableview.reloadData()
            print("GET")
        }
        
       
        
    }
    
    func deleteContetn(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        
        let actionDelet = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            
            
            let id = self.calendarEvents[indexPath.section].records?[indexPath.row].id
            let link = "\(URLs().eventURl)\(String(describing: id!) + "/")"
            
            EventSetup.asyncGetPostRequest(link, method: .delete, parameters: nil, header: nil) { (result: EventBase) in
            }
            
//            self.calendarEvents.remove(at: indexPath.section)
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
            vc.nameGameTextfield.text = ev[indexPath.section].records?[indexPath.row].name ?? ""
            vc.infoTextview.text = ev[indexPath.section].records?[indexPath.row].info ?? ""
            vc.dateGameTextfield.text = dates.dateFormated(data: (ev[indexPath.section].records?[indexPath.row].date)!)
            vc.organizerTextfield.text = ev[indexPath.section].records?[indexPath.row].organizerId.flatMap(String.init)
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
        view.addSubview(tableview)
        tableview.reloadData()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .gray
        tableviewFrame()
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
        
        let ev = calendarEvents[indexPath.section].records?[indexPath.row]
        cell.nameLabel?.text = ev?.name
        
        let dates = String()
        cell.dateLabel?.text = dates.dateFormated(data: (ev?.date)!)
        
        
        cell.backgroundColor = .gray
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let delete = self.deleteContetn(rowIndexPathAt: indexPath)
        let edit = self.editContent(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ev = calendarEvents
        
        let vc = EventsViewController()
        
        
        vc.name = ev[indexPath.section].records?[indexPath.row].name ?? ""
        vc.type = ev[indexPath.section].records?[indexPath.row].type ?? ""
        vc.info = ev[indexPath.section].records?[indexPath.row].info ?? ""
//        vc.date = ev[indexPath.section].records?[indexPath.row].date ?? ""
       let dates = String()
        
        vc.date = dates.dateFormated(data: (ev[indexPath.section].records?[indexPath.row].date)!)
        
        navigationController?.pushViewController(vc, animated: true)        
    }
    
}


extension String {
    func dateFormated(data: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
        let data = dateFormatter.date(from: data)!
        let dateFormatted = DateFormatter()
        dateFormatted.locale = .init(identifier: "ru_RU_POSIX")
        dateFormatted.dateFormat = "d MMMM yyyy"
        let dateForm = dateFormatted.string(from: data)
        return dateForm
    }
}
