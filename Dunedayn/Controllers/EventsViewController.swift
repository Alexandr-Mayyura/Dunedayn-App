//
//  EventsViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import UIKit

class EventsViewController: UIViewController, UITextViewDelegate {
    
    
    let scrollView = UIScrollView()
    let firstView = UIView()
    let dateLabel = UILabel()
    let typeLabel = UILabel()
    let nameLabel = UILabel()
    let infoTextview = UITextView()
    
    var date = String()
    var name = String()
    var type = String()
    var info = String()
 
    func loadLabel() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        firstView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        infoTextview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(firstView)
        firstView.addSubview(typeLabel)
        firstView.addSubview(nameLabel)
        firstView.addSubview(dateLabel)
        firstView.addSubview(infoTextview)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            firstView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            firstView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            firstView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            firstView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
            
            typeLabel.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 30),
            typeLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            typeLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            typeLabel.heightAnchor.constraint(equalToConstant: 36),
            
            nameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 36),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            dateLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 36),
            
            infoTextview.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            infoTextview.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            infoTextview.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            infoTextview.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 0)
        ])
        
        typeLabel.textAlignment = .center
        typeLabel.font = typeLabel.font.withSize(28)
        typeLabel.numberOfLines = 0
        
        nameLabel.textAlignment = .center
        nameLabel.font = nameLabel.font.withSize(28)
        nameLabel.numberOfLines = 0
        
        dateLabel.font = dateLabel.font.withSize(28)
        dateLabel.textAlignment = .center
        dateLabel.numberOfLines = 0
        
        infoTextview.delegate = self
        infoTextview.font = infoTextview.font?.withSize(26)
        infoTextview.textColor = .black
//        infoTextview.textAlignment = .center
        infoTextview.isEditable = false
        infoTextview.dataDetectorTypes = .link
        infoTextview.linkTextAttributes = [.foregroundColor: UIColor.black, .underlineStyle: NSUnderlineStyle.single.rawValue]
        infoTextview.backgroundColor = .gray
        infoTextview.isScrollEnabled = false
    
  
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
