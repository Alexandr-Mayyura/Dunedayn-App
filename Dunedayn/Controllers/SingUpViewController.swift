//
//  SingUpViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class SingUpViewController: UIViewController, UITextFieldDelegate {
    
    let imageSold = UIImage(named: "LogoDND")
    
    @IBOutlet var imageSoldier: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var firstPasswordLabel: UILabel!
    @IBOutlet var secondPasswordLabel: UILabel!
    
    @IBOutlet var nicknameTextfield: UITextField!
    
    @IBOutlet var firstPasswordTextfield: UITextField!
    
    @IBOutlet var secondPasswordTextfield: UITextField!
    
    @IBAction func registrationButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nicknameTextfield {
           textField.resignFirstResponder()
            firstPasswordTextfield.becomeFirstResponder()
        } else if textField == firstPasswordTextfield {
            secondPasswordTextfield.becomeFirstResponder()
           textField.resignFirstResponder()
        } else if textField == secondPasswordTextfield {
           textField.resignFirstResponder()
        }
       return true
      }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nicknameTextfield.setUnderLine()
        firstPasswordTextfield.setUnderLine()
        secondPasswordTextfield.setUnderLine()
    }
}

extension UITextField {

    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 20, width: layer.bounds.width, height: 1.0)
                bottomLine.backgroundColor = UIColor.white.cgColor
        
        
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = false
    }

}
