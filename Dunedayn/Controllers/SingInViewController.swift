//
//  SingInViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class SingInViewController: UIViewController, UITextFieldDelegate{
    
    var calendarEvents = EventBase()
    var organizers = OrganizerBase()
    var type = TypeBase()

    let logoImage = UIImage(named: "LogoDND")
    
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var logoLabel: UILabel!
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    func animation() {
        UIView.animate(withDuration: 0.3, animations: { [weak self]() -> Void in
            self?.logoImageView.transform = .init(scaleX: 0.3, y: 0.3)
        })
    }
    
    @IBAction func singInButton(_ sender: Any) {
        animation()
    }
    
    @IBAction func singUpButton(_ sender: Any) {
    }

    @IBOutlet var firstView: UIView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    
    func addContetnt(){
        
        EventSetup.asyncRequest(URLs().orgUrl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: OrganizerBase) in
            guard let self = self else { return }
            self.organizers = result
                EventSetup.asyncRequest(URLs().typeURL, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: TypeBase) in
                    guard let self = self else { return }
                    self.type = result
                    EventSetup.asyncRequest(URLs().eventURl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader) { [weak self] (result: EventBase) in
                        guard let self = self else { return }
                        self.calendarEvents = result

                        RealmManager.sharedInstance.save(object: self.organizers)
                        RealmManager.sharedInstance.save(object: self.calendarEvents)
                        RealmManager.sharedInstance.save(object: self.type)
                }
            }
        }
    }

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
       
        addContetnt()
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


