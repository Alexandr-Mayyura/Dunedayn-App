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
        let backImage = Images()
        imageSoldier.image = imageSold
        
        view.insertSubview(backImage.backgraundImage, at: 0)
        backImage.backgraundImage.image = backImage.image
        backImage.backgraundImage.contentMode = .scaleAspectFill
        
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
