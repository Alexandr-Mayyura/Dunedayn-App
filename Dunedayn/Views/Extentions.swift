//
//  Extentions.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 12.09.2021.
//

import Foundation
import UIKit

// closeKeyboard
extension UIViewController {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

// date pickerview
//extension UITextField {
//
//    func setInputViewDatePicker(target: Any, selector: Selector) {
//
//        let screenWidth = UIScreen.main.bounds.width
//        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
//        datePicker.datePickerMode = .date
//
//        if #available(iOS 14.5, *) {
//            datePicker.preferredDatePickerStyle = .inline
//          datePicker.sizeToFit()
//        }
//        self.inputView = datePicker
//
//        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
//        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
//        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
//        toolBar.setItems([cancel, flexible, barButton], animated: false)
//        self.inputAccessoryView = toolBar
//    }
//
//    @objc func tapCancel() {
//        self.resignFirstResponder()
//    }
//}
//
