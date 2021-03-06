//
//  SingUpAttributes.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.10.2021.
//

import Foundation
import UIKit

extension SingUpViewController {
    
    func attributes(){
        let imageSold = UIImage(named: "LogoDND")
        imageSoldier.image = imageSold
        
        let image = BackgroundImages()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)
        
        nicknameTextfield.delegate = self
        firstPasswordTextfield.delegate = self
        secondPasswordTextfield.delegate = self
        
        nicknameTextfield.returnKeyType = .continue
        firstPasswordTextfield.returnKeyType = .continue
        secondPasswordTextfield.returnKeyType = .done
 
    }
    
    func textfieldLine() {
        nicknameTextfield.setUnderLine()
        firstPasswordTextfield.setUnderLine()
        secondPasswordTextfield.setUnderLine()
    } 
}
