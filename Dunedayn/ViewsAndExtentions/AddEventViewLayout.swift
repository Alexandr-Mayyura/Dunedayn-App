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
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        organizerLabel.translatesAutoresizingMaskIntoConstraints = false
        nameGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        dateGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        organizerTextfield.translatesAutoresizingMaskIntoConstraints = false
        infoTextview.translatesAutoresizingMaskIntoConstraints = false
        typeTextfield.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        let images = Images()
        images.backgraundImage.translatesAutoresizingMaskIntoConstraints = false
        images.backgraundImage.image = images.image
        
        view.addSubview(images.backgraundImage)
        view.addSubview(scrollView)
        
        scrollView.addSubview(secondView)
        secondView.addSubview(nameLabel)
        secondView.addSubview(dateLabel)
        secondView.addSubview(infoLabel)
        secondView.addSubview(typeLabel)
        secondView.addSubview(organizerLabel)
        secondView.addSubview(dateGameTextfield)
        secondView.addSubview(nameGameTextfield)
        secondView.addSubview(organizerTextfield)
        secondView.addSubview(infoTextview)
        secondView.addSubview(typeTextfield)
        secondView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            
            images.backgraundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            images.backgraundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            images.backgraundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            images.backgraundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            secondView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            secondView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            secondView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
            
            nameLabel.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 5),
            nameLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameGameTextfield.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            nameGameTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            nameGameTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            nameGameTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            dateLabel.topAnchor.constraint(equalTo: nameGameTextfield.bottomAnchor, constant: 6),
            dateLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor, constant: 0),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dateGameTextfield.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            dateGameTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            dateGameTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            dateGameTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            organizerLabel.topAnchor.constraint(equalTo: dateGameTextfield.bottomAnchor, constant: 6),
            organizerLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor, constant: 0),
            organizerLabel.heightAnchor.constraint(equalToConstant: 30),
            
            organizerTextfield.topAnchor.constraint(equalTo: organizerLabel.bottomAnchor, constant: 6),
            organizerTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            organizerTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            organizerTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            typeLabel.topAnchor.constraint(equalTo: organizerTextfield.bottomAnchor, constant: 6),
            typeLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor, constant: 0),
            typeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            typeTextfield.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 6),
            typeTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            typeTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            typeTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            infoLabel.topAnchor.constraint(equalTo: typeTextfield.bottomAnchor, constant: 6),
            infoLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor, constant: 0),
            infoLabel.heightAnchor.constraint(equalToConstant: 30),
            
            infoTextview.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 6),
            infoTextview.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            infoTextview.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            
            addButton.topAnchor.constraint(equalTo: infoTextview.bottomAnchor, constant: 25),
            addButton.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            addButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 0)
        ])

        func attributesLabel(_ label: UILabel, _ text: String) {
            label.textColor = .white
            
            let attrString = NSAttributedString(
                string: text, attributes: [
                    NSAttributedString.Key.strokeColor: UIColor.black,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeWidth: -1.0,
                    NSAttributedString.Key.font: UIFont.init(name: "Helvetica Neue Medium", size: 18)!
                ]
            )
            label.attributedText = attrString
        }
        
        attributesLabel(nameLabel, "Название")
        attributesLabel(dateLabel, "Дата")
        attributesLabel(organizerLabel, "Организатор")
        attributesLabel(typeLabel, "Тип")
        attributesLabel(infoLabel, "Описание")
        
        nameGameTextfield.placeholder = "Enter Name"
        nameGameTextfield.font = .systemFont(ofSize: 20)
        nameGameTextfield.borderStyle = .roundedRect
        nameGameTextfield.autocorrectionType = .no
        nameGameTextfield.keyboardType = .default
        nameGameTextfield.returnKeyType = .continue
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
        
        addButton.tintColor = .white
        addButton.backgroundColor = .clear
        addButton.titleLabel?.font = UIFont.init(name: "Helvetica Neue", size: 34)
        addButton.setTitle("Сохранить", for: .normal)
        title = "Добавьте игру"
        
        func toolBarStyle(_ toolBar: UIToolbar){
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.sizeToFit()
        }
        
        toolBarStyle(orgToolBar)
        toolBarStyle(typeToolBar)
        toolBarStyle(dateToolBar)
    }
}

extension AddEventViewController {
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

        @objc func keyboardWillShow(notification: NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 40
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification: NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    

}
