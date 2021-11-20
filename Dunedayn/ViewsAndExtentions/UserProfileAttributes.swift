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
        

        view.addSubview(substrateView)
        view.addSubview(userImageView)
        view.addSubview(userNameLabel)
        view.addSubview(nameLabel)
        
        
        let color = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.85)
        
        substrateView.backgroundColor = color
        substrateView.layer.cornerRadius = 10
        substrateView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            userImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            userImageView.heightAnchor.constraint(equalToConstant: 200),
            userImageView.widthAnchor.constraint(equalToConstant: 200),
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            substrateView.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: -5),
            substrateView.leftAnchor.constraint(equalTo: userImageView.leftAnchor, constant: -5),
            substrateView.rightAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 5),
            substrateView.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5),
            
            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 30),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
        
            userNameLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 60),
            userNameLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor, constant: 0)
            
            
        ])
        userImageView.tintColor = .darkGray
        userImageView.backgroundColor = .clear
        userImageView.layer.cornerRadius = 10
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFill
        
        userNameLabel.backgroundColor = color
        userNameLabel.clipsToBounds = true
        userNameLabel.layer.cornerRadius = 10
        userNameLabel.textColor = .white
        userNameLabel.font = UIFont.init(name: "Helvetica Neue", size: 30)
        
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = .white
        nameLabel.font = UIFont.init(name: "Helvetica Neue", size: 26)
        
    
    }
}
