//
//  UserMenuViewLayout.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 27.10.2021.
//

import Foundation
import UIKit

extension UserMenuViewController {
    
    func attributes() {

        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        let image = BackgroundImages()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)
        
        self.title = "Dundenbay"
        
        
        NSLayoutConstraint.activate (
            [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            ])
    }
}
