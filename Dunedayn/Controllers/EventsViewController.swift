//
//  EventsViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import UIKit

class EventsViewController: UIViewController {
    
    var dateLabel = UILabel()
    var typeLabel = UILabel()
    var nameLabel = UILabel()
    var infoTextview = UITextView()
    
    var date = String()
    var name = String()
    var type = String()
    var info = String()
 
    func loadLabel() {
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        infoTextview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(typeLabel)
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
        view.addSubview(infoTextview)
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            infoTextview.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            infoTextview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoTextview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoTextview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
        ])
        
        typeLabel.textAlignment = .center
        typeLabel.font = typeLabel.font.withSize(28)
        
        nameLabel.textAlignment = .center
        nameLabel.font = nameLabel.font.withSize(28)
        
        dateLabel.font = dateLabel.font.withSize(28)
        dateLabel.textAlignment = .center
        
        infoTextview.font = infoTextview.font?.withSize(26)
        infoTextview.textAlignment = .center
        infoTextview.isEditable = false
        infoTextview.dataDetectorTypes = .link
        infoTextview.linkTextAttributes = [.foregroundColor: UIColor.black, .underlineStyle: NSUnderlineStyle.single.rawValue]
        infoTextview.textColor = .black
        infoTextview.autocorrectionType = .no
        infoTextview.backgroundColor = .gray
    
  
    }
    
    func dateFormated(data: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let data = dateFormatter.date(from: data)!
        let dateFormatted = DateFormatter()
        dateFormatted.locale = .init(identifier: "ru_RU_POSIX")
        dateFormatted.dateFormat = "d MMMM yyyy"
        let finalDate = dateFormatted.string(from: data)
        return finalDate
    }

    override func viewWillAppear(_ animated: Bool) {
        loadLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        self.title = name
        nameLabel.text = name
        typeLabel.text = type
        infoTextview.text = info
        dateLabel.text = date
    }
}
