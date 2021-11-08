//
//  AlertViews.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 24.10.2021.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    func alertView(_ titel: String) -> UIAlertController {
        let av = UIAlertController(title: titel, message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
        
        av.addAction(cancelAction)
        return av
    }
    
    func addNameAlertView(_ titel: String, _ label: UILabel) -> UIAlertController {
       
        let av = UIAlertController(title: titel, message: "", preferredStyle: .alert)
        av.addTextField { (UITextField) in }
        
        let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
        let addAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
           
            let textFieldReminder = (av.textFields?.first)! as UITextField
            let user = User()
            user.name = " \(textFieldReminder.text ?? "") "
            label.text = " \(textFieldReminder.text ?? "") "
            RealmManager.sharedInstance.save(object: user)
        }
        
        av.addAction(addAction)
        av.addAction(cancelAction)
        return av
    }
    
}
