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

        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background max")!)

        self.title = "Dunedayn"
        
        NSLayoutConstraint.activate (
            [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            ])
    }
}
