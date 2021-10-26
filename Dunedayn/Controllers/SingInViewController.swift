//
//  SingInViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class SingInViewController: UIViewController, UITextFieldDelegate{

    let logoImage = UIImage(named: "LogoDND")
    
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var logoLabel: UILabel!
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    @IBAction func singInButton(_ sender: Any) {
    }
    
    @IBAction func singUpButton(_ sender: Any) {
    }

    @IBOutlet var firstView: UIView!
    
    @IBOutlet var scrollView: UIScrollView!

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        attributes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextfield {
           textField.resignFirstResponder()
            passwordTextfield.becomeFirstResponder()
        } else if textField == passwordTextfield {
           textField.resignFirstResponder()
        }
       return true
      } 
}


