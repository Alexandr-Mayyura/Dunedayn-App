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
        view.addSubview(collectionViewTicker)
        collectionViewMenu.backgroundColor = .clear
        collectionViewTicker.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
        let image = Images()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)

        self.title = "Dunedayn"
        
        NSLayoutConstraint.activate (
            [
                collectionViewTicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                collectionViewTicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionViewTicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionViewTicker.heightAnchor.constraint(equalToConstant: 60),
                
                collectionViewMenu.topAnchor.constraint(equalTo: collectionViewTicker.bottomAnchor, constant: 15),
                collectionViewMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionViewMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                collectionViewMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            ])
    }
}
