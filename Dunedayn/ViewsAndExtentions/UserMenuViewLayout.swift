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

        view.addSubview(userMenuCollectionView)
        view.addSubview(collectionViewTicker)
        
        collectionViewTicker.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
        userMenuCollectionView.backgroundColor = .clear
        let image = BackgroundImages()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)
        
        self.title = "Dundenbay"
        
        
        NSLayoutConstraint.activate (
            [
                collectionViewTicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                collectionViewTicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionViewTicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionViewTicker.heightAnchor.constraint(equalToConstant: 60),
                
                userMenuCollectionView.topAnchor.constraint(equalTo: collectionViewTicker.bottomAnchor, constant: 15),
                userMenuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                userMenuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                userMenuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            ])
    }
}
