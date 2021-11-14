//
//  UserProfileAttributes.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.11.2021.
//

import Foundation
import UIKit


extension UserProfileViewController {
    
    func attributes() {
        
        let image = BackgroundImages()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)
        

        view.addSubview(substrate)
        view.addSubview(userImage)
        view.addSubview(userName)
        
        
        let color = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.85)
        
        substrate.backgroundColor = color
        substrate.layer.cornerRadius = 10
        substrate.translatesAutoresizingMaskIntoConstraints = false
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            userImage.heightAnchor.constraint(equalToConstant: 200),
            userImage.widthAnchor.constraint(equalToConstant: 200),
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            substrate.topAnchor.constraint(equalTo: userImage.topAnchor, constant: -5),
            substrate.leftAnchor.constraint(equalTo: userImage.leftAnchor, constant: -5),
            substrate.rightAnchor.constraint(equalTo: userImage.rightAnchor, constant: 5),
            substrate.bottomAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 5),
            
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        
        ])
        userImage.tintColor = .darkGray
        userImage.backgroundColor = .clear
        userImage.layer.cornerRadius = 10
        userImage.clipsToBounds = true
        userImage.contentMode = .scaleAspectFill
        
        userName.backgroundColor = .clear
        userName.textColor = .white
        userName.font = UIFont.init(name: "Helvetica Neue", size: 26)
        
        
        
    }
}
