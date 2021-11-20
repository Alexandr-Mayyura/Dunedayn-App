//
//  ChekListViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 11.11.2021.
//

import UIKit

class ChekListViewController: UIViewController {
    
   let chek = Task()
    
    let tableview: UITableView = {
       let tv = UITableView(frame: .zero)
       tv.translatesAutoresizingMaskIntoConstraints = false
       tv.register(ChekListTableViewCell.self, forCellReuseIdentifier: "chekListCell")
       return tv
   }()
    
    @objc func pushAddAction(_ sender: UIButton) {
        
        let alertVC = UIAlertController(title: "Новая запись", message: "Добавь, чтобы не забыть", preferredStyle: .alert)
       
            alertVC.addTextField { (UITextField) in }
       
              let cancelAction = UIAlertAction.init(title: "Закрыть", style: .default, handler: nil)

              let addAction = UIAlertAction.init(title: "Сохранить", style: .cancel) { (UIAlertAction) -> Void in
       
                let textFieldReminder = (alertVC.textFields?.first)! as UITextField
      
                let reminderItem = Task()
                  reminderItem.notes = textFieldReminder.text!
                  reminderItem.isCompleted = false
                  
                  if RealmManager.sharedInstance.get(object: self.chek).last?.id == nil {
                      reminderItem.id += 1
                  } else {
                  guard let number = RealmManager.sharedInstance.get(object: self.chek).last?.id else {return}
                  reminderItem.id = number + 1
                  }
                  RealmManager.sharedInstance.save(object: reminderItem)
                  

                  self.tableview.setEditing(false, animated: true)
                  self.tableview.reloadData()
              }
        
            alertVC.addAction(cancelAction)
            alertVC.addAction(addAction)
        
          present(alertVC, animated: true, completion: nil)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.delegate = self
        tableview.dataSource = self
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector (pushAddAction))
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white

        attributes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
}

extension ChekListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return RealmManager.sharedInstance.get(object: chek).count
    }
       
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chekListCell", for: indexPath) as! ChekListTableViewCell
        cell.backgroundColor = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.85)
        
        let task = RealmManager.sharedInstance.get(object: chek).sorted(byKeyPath: "isCompleted", ascending: true)

        cell.nameLabel?.text = task[indexPath.row].notes
        cell.tintColor = .white

        if task[indexPath.row].isCompleted == true {
            cell.accessoryType = .checkmark
            cell.nameLabel?.textColor = .gray
        } else {
            cell.accessoryType = .none
            cell.nameLabel?.textColor = .white
        }
        return cell
    }

     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == .delete {
            
            let item = RealmManager.sharedInstance.get(object: self.chek)
            RealmManager.sharedInstance.delete(object: item[indexPath.row])
                                         
            tableView.deleteRows(at:[indexPath], with: .automatic)
        }
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let reminderItem = Task()
       
         let itemSort = RealmManager.sharedInstance.get(object: chek).sorted(byKeyPath: "isCompleted", ascending: true)
         
         reminderItem.isCompleted = !itemSort[indexPath.row].isCompleted
         reminderItem.notes = itemSort[indexPath.row].notes
         reminderItem.id = itemSort[indexPath.row].id
         
        RealmManager.sharedInstance.save(object: reminderItem)
         
//         tableView.reloadRows(at: [indexPath], with: .automatic)
         self.tableview.reloadData()

    }

    
    
    
}
