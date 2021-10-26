//
//  AlertViews.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 24.10.2021.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    func alertView(_ titel: String) -> UIAlertController {
        let av = UIAlertController(title: titel, message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
        
        av.addAction(cancelAction)
        return av
    }
    
}
