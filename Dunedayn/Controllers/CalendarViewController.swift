//
//  CalendarViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class CalendarViewController: UIViewController {
    
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

    
    
    override func viewWillAppear(_ animated: Bool) {
// add tableview
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .gray
        
        tableviewFrame()
   
// add data to EventBase
        
        EventSetup().asyncGetRequest(URLs().eventURl) { (datas: EventBase) in
            self.calendarEvents = [datas]
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return calendarEvents[section].events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarTableViewCell
        
        let ev = calendarEvents[indexPath.section].events
        cell.nameLabel?.text = ev?[indexPath.row].name
        let dates = String()
        cell.dateLabel?.text = dates.dateFormated(data: ev?[indexPath.row].date ?? "")
        
        
        cell.backgroundColor = .gray
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ev = calendarEvents[indexPath.section].events
        
        let vc = EventsViewController()
        
        
        vc.name = ev?[indexPath.row].name ?? ""
        vc.type = ev?[indexPath.row].type ?? ""
        vc.info = ev?[indexPath.row].info ?? ""
        
       let dates = String()
        
        vc.date = dates.dateFormated(data: ev?[indexPath.row].date ?? "")
        
        navigationController?.pushViewController(vc, animated: true)        
    }
}


extension String {
    func dateFormated(data: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let data = dateFormatter.date(from: data)!
        let dateFormatted = DateFormatter()
        dateFormatted.locale = .init(identifier: "ru_RU_POSIX")
        dateFormatted.dateFormat = "d MMMM yyyy"
        let dateForm = dateFormatted.string(from: data)
        return dateForm
    }
}
