//
//  SingInViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class SingInViewController: UIViewController, UITextFieldDelegate{
    
    let image = UIImage(named: "Background")
    let backgraundImage = UIImageView(frame: UIScreen.main.bounds)
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
    
    let attrString = NSAttributedString(
        string: "MSK Dunedayn", attributes: [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeWidth: -2.0
        ]
    )
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        view.insertSubview(backgraundImage, at: 0)
        backgraundImage.image = image
        backgraundImage.contentMode = .scaleAspectFill
        
        firstView.backgroundColor = .clear
        logoImageView.image = logoImage
        logoLabel.attributedText = attrString
        
        nameTextfield.delegate = self
        passwordTextfield.delegate = self
        
        nameTextfield.returnKeyType = UIReturnKeyType.continue
        passwordTextfield.returnKeyType = UIReturnKeyType.done
        
        registerForKeyboardNotification()
        addTapGestureToHideKeyboard()
     

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


