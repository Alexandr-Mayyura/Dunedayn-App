//
//  CalendarViewLayout.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 23.10.2021.
//

import Foundation
import UIKit

extension CalendarViewController {
    func attributes() {
        
        view.addSubview(tableview)
        let images = Images()
        images.backgraundImage.image = images.image
        images.backgraundImage.contentMode = .scaleAspectFill
        tableview.backgroundView = images.backgraundImage
        
        self.title = "Календарь"
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
