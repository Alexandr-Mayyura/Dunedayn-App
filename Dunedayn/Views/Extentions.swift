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


