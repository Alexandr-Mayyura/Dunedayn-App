//
//  TeamMenuViewLayout.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 23.10.2021.
//

import Foundation
import UIKit

extension TeamMenuViewController {
    
    func attributes() {
        
        view.addSubview(collectionViewMenu)

        collectionViewMenu.backgroundColor = .clear

        let image = BackgroundImages()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)

        self.title = "Dunedayn"
        
        NSLayoutConstraint.activate (
            [
                collectionViewMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
                collectionViewMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionViewMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                collectionViewMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            ])
    }
}
