//
//  TextFieldLine.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.10.2021.
//

import Foundation
import UIKit

extension UITextField {

    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 20, width: layer.bounds.width, height: 1.0)
                bottomLine.backgroundColor = UIColor.white.cgColor
        
        
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = false
    }

}
