//
//  ExtentionAddEventPickers.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 24.10.2021.
//

import Foundation
import UIKit

extension AddEventViewController {
    
    func extetionPicker() {

        typePickerView.typeDelegate = self
        typePicker.dataSource = typePickerView
        typePicker.delegate = typePickerView

        let doneButtonType = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneType))
        let spaceButtonType = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButtonType = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancelType))
        typeToolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        typeToolBar.setItems([cancelButtonType, spaceButtonType, doneButtonType], animated: false)

        typeTextfield.inputView = typePicker
        typeTextfield.inputAccessoryView = typeToolBar

        organizerPickerView.delgate = self
        organizerPicker.dataSource = organizerPickerView
        organizerPicker.delegate = organizerPickerView

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneOrganizer))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancelOrg))
        orgToolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        orgToolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)

        organizerTextfield.inputView = organizerPicker
        organizerTextfield.inputAccessoryView = orgToolBar

        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneDate))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancelDate))
        dateToolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        dateToolBar.setItems([cancel, flexible, barButton], animated: false)

        dateGameTextfield.inputView = datePicker
        dateGameTextfield.inputAccessoryView = dateToolBar
        
        nameGameTextfield.delegate = self
    }
}
