//
//  EventViewLayout.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 23.10.2021.
//

import Foundation
import UIKit

extension EventsViewController {
    
    func loadLabel() {
            
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        firstView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        infoTextview.translatesAutoresizingMaskIntoConstraints = false
        typeOrganizerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let images = Images()
             images.backgraundImage.translatesAutoresizingMaskIntoConstraints = false
             images.backgraundImage.image = images.image
             view.addSubview(images.backgraundImage)
        
        view.addSubview(scrollView)
        scrollView.addSubview(firstView)
        firstView.addSubview(nameLabel)
        firstView.addSubview(dateLabel)
        firstView.addSubview(infoTextview)
        firstView.addSubview(typeOrganizerLabel)
            
        NSLayoutConstraint.activate([
            
            images.backgraundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            images.backgraundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            images.backgraundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            images.backgraundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
              
            scrollView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo:  view.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo:  view.bottomAnchor, constant: 0),
            
            
            firstView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            firstView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            firstView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            firstView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
                
            nameLabel.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalToConstant: 36),
                
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor, constant: 0),
            dateLabel.heightAnchor.constraint(equalToConstant: 36),
  
            typeOrganizerLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            typeOrganizerLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor, constant: 0),
            typeOrganizerLabel.heightAnchor.constraint(equalToConstant: 36),
                
            infoTextview.topAnchor.constraint(equalTo: typeOrganizerLabel.bottomAnchor, constant: 20),
            infoTextview.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            infoTextview.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            infoTextview.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -20)
            ])
        
        let color = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.85)
        
        nameLabel.textAlignment = .center
        nameLabel.font = nameLabel.font.withSize(24)
        nameLabel.numberOfLines = 0
        nameLabel.text = nameLabel.text?.uppercased()
        nameLabel.textColor = .white
        nameLabel.backgroundColor = color
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 10
        
        dateLabel.font = dateLabel.font.withSize(17)
        dateLabel.textAlignment = .center
        dateLabel.numberOfLines = 0
        dateLabel.textColor = .white
        dateLabel.backgroundColor = color
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 10
            
        typeOrganizerLabel.font = typeOrganizerLabel.font.withSize(17)
        typeOrganizerLabel.textAlignment = .center
        typeOrganizerLabel.numberOfLines = 0
        typeOrganizerLabel.textColor = .white
        typeOrganizerLabel.backgroundColor = color
        typeOrganizerLabel.layer.masksToBounds = true
        typeOrganizerLabel.layer.cornerRadius = 10
            
        infoTextview.font = infoTextview.font?.withSize(16)
        infoTextview.isEditable = false
        infoTextview.textColor = .white
        infoTextview.dataDetectorTypes = .link
        infoTextview.linkTextAttributes = [.foregroundColor: UIColor.white, .underlineStyle: NSUnderlineStyle.single.rawValue]
        infoTextview.backgroundColor = color
        infoTextview.layer.masksToBounds = true
        infoTextview.layer.cornerRadius = 10
        infoTextview.isScrollEnabled = false
    }
}
