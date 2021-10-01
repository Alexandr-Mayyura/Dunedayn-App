//
//  AddEventViewLayout.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.09.2021.
//

import Foundation
import UIKit

extension AddEventViewController {
    
    func positionViews() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        nameGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        dateGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        organizerTextfield.translatesAutoresizingMaskIntoConstraints = false
        infoTextview.translatesAutoresizingMaskIntoConstraints = false
        typeTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(secondView)
        secondView.addSubview(dateGameTextfield)
        secondView.addSubview(nameGameTextfield)
        secondView.addSubview(organizerTextfield)
        secondView.addSubview(infoTextview)
        secondView.addSubview(typeTextfield)
        secondView.addSubview(addButton)

        secondView.backgroundColor = .gray
        view.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            secondView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            secondView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            secondView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
            
            nameGameTextfield.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 20),
            nameGameTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            nameGameTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            nameGameTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            dateGameTextfield.topAnchor.constraint(equalTo: nameGameTextfield.bottomAnchor, constant: 20),
            dateGameTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            dateGameTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            dateGameTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            organizerTextfield.topAnchor.constraint(equalTo: dateGameTextfield.bottomAnchor, constant: 20),
            organizerTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            organizerTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            organizerTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            typeTextfield.topAnchor.constraint(equalTo: organizerTextfield.bottomAnchor, constant: 20),
            typeTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            typeTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            typeTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            
            infoTextview.topAnchor.constraint(equalTo: typeTextfield.bottomAnchor, constant: 20),
            infoTextview.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            infoTextview.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            
            addButton.topAnchor.constraint(equalTo: infoTextview.bottomAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            addButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 0)
        ])
        
        nameGameTextfield.placeholder = "Enter Name"
        
        nameGameTextfield.font = .systemFont(ofSize: 20)
        nameGameTextfield.borderStyle = .roundedRect
        nameGameTextfield.autocorrectionType = .no
        nameGameTextfield.keyboardType = .default
        nameGameTextfield.returnKeyType = .done
        nameGameTextfield.clearButtonMode = .whileEditing
        nameGameTextfield.contentVerticalAlignment = .center
        nameGameTextfield.textColor = .black
        nameGameTextfield.backgroundColor = .white
        
        dateGameTextfield.placeholder = "Enter Date"
        dateGameTextfield.font = .systemFont(ofSize: 20)
        dateGameTextfield.borderStyle = .roundedRect
        dateGameTextfield.autocorrectionType = .no
        dateGameTextfield.keyboardType = .default
        dateGameTextfield.returnKeyType = .done
        dateGameTextfield.clearButtonMode = .whileEditing
        dateGameTextfield.contentVerticalAlignment = .center
        dateGameTextfield.textColor = .black
        dateGameTextfield.backgroundColor = .white
        
        organizerTextfield.placeholder = "Enter Organizer"
        organizerTextfield.font = .systemFont(ofSize: 20)
        organizerTextfield.borderStyle = .roundedRect
        organizerTextfield.autocorrectionType = .no
        organizerTextfield.keyboardType = .default
        organizerTextfield.returnKeyType = .done
        organizerTextfield.clearButtonMode = .whileEditing
        organizerTextfield.contentVerticalAlignment = .center
        organizerTextfield.textColor = .black
        organizerTextfield.backgroundColor = .white
        
        typeTextfield.placeholder = "Enter Type Game"
        typeTextfield.font = .systemFont(ofSize: 20)
        typeTextfield.borderStyle = .roundedRect
        typeTextfield.autocorrectionType = .no
        typeTextfield.keyboardType = .default
        typeTextfield.returnKeyType = .done
        typeTextfield.clearButtonMode = .whileEditing
        typeTextfield.contentVerticalAlignment = .center
        typeTextfield.textColor = .black
        typeTextfield.backgroundColor = .white
        
        infoTextview.font = .systemFont(ofSize: 20)
        infoTextview.layer.cornerRadius = 8
        infoTextview.autocorrectionType = .no
        infoTextview.keyboardType = .default
        infoTextview.returnKeyType = .done
        infoTextview.scrollIndicatorInsets = .zero
        infoTextview.textColor = .black
        infoTextview.backgroundColor = .white
        infoTextview.isScrollEnabled = false
    }
    
}
