//
//  SingInAttributes.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 24.10.2021.
//

import Foundation
import UIKit

extension SingInViewController {
    
    func attributes(){
        let attrString = NSAttributedString(
            string: "MSK Dunedayn", attributes: [
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeWidth: -2.0
            ]
        )
        let image = BackgroundImages()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)
           
        firstView.backgroundColor = .clear
        logoImageView.image = logoImage
        logoLabel.attributedText = attrString
           
        nameTextfield.delegate = self
        passwordTextfield.delegate = self
           
        nameTextfield.returnKeyType = UIReturnKeyType.continue
        passwordTextfield.returnKeyType = UIReturnKeyType.done
        
        nameTextfield.backgroundColor = .white
        passwordTextfield.backgroundColor = .white
        
        nameTextfield.textColor = .black
        passwordTextfield.textColor = .black
           
        registerForKeyboardNotification()
        addTapGestureToHideKeyboard()
        
    }
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 60
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
}
