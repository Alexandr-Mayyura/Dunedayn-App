//
//  EventLabel.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation
import UIKit

class EventLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initializeLabel()
        }

//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            initializeLabel()
//        }

        func initializeLabel() {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.textAlignment = .center
            self.font = UIFont(name: "Halvetica", size: 17)
            self.textColor = .black
           

        }
    
    
    
}
