//
//  SingUpViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class SingUpViewController: UIViewController, UITextFieldDelegate {
    
    
    
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
        attributes()
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
        textfieldLine()
    }
}

