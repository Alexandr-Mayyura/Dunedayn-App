//
//  AddEventViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 12.09.2021.
//

import UIKit


class AddEventViewController: UIViewController, UITextFieldDelegate, OrgPickerViewProtocol, TypePickerViewProtocol {

    var organizers = OrganizerBase()
    var types = TypeBase()
    var calendar = EventBase()
    
    let organizerPickerView = OrganozerPickerView()
    let typePickerView = TypePickerView()
    
    // protocol OrgPickerViewProtocol metods
    func idOrg(selectedRowValue: Int?) {
        organizer = selectedRowValue
    }
    func orgPickerDidSelectRow(selectedRowValue: String?) {
        organizerTextfield.text = selectedRowValue
    }
    // protocol TypePickerViewProtocol metods
    func typePickerDidSelectRow(selectedRowValue: String?) {
        typeTextfield.text = selectedRowValue
    }
    func myIdType(selectedRowValue: Int?) {
        type = selectedRowValue
    }

    var organizer : Int?
    var id: Int?
    var type: Int?
    
    // views
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let organizerLabel = UILabel()
    let infoLabel = UILabel()
    let typeLabel = UILabel()
    
    let nameGameTextfield = UITextField()
    let dateGameTextfield = UITextField()
    let organizerTextfield = UITextField()
    let infoTextview = UITextView()
    let typeTextfield = UITextField()
    let scrollView = UIScrollView()
    let secondView = UIView()
    let addButton : UIButton = {
        let bt = UIButton()
        bt.addTarget(self, action: #selector(postDateForBackend), for: .touchUpInside)
        return bt
    }()
    
    let organizerPicker = UIPickerView()
    let datePicker = UIDatePicker()
    let typePicker = UIPickerView()
    
    let orgToolBar = UIToolbar ()
    let dateToolBar = UIToolbar()
    let typeToolBar = UIToolbar()

    //  tap datePicker method
    @objc func tapDoneDate() {
        if let datePicker = self.dateGameTextfield.inputView as? UIDatePicker {
            let dates = String()
            let date = dates.dateFormatInDate(date: datePicker.date)
            self.dateGameTextfield.text = date
        }
        self.dateGameTextfield.resignFirstResponder()
        self.organizerTextfield.becomeFirstResponder()
    }
// tap cancel picker mothod
    @objc func tapCancelDate() {
        self.dateGameTextfield.text = ""
        self.dateGameTextfield.resignFirstResponder()
    }
    
    @objc func tapCancelOrg() {
        self.organizerTextfield.text = ""
        self.organizerTextfield.resignFirstResponder()
    }
    
    @objc func tapCancelType() {
        self.typeTextfield.text = ""
        self.typeTextfield.resignFirstResponder()
    }
    
    // tap done picker mothod
    @objc func tapDoneOrganizer() {
        if organizerTextfield.text == "" {
            self.organizerTextfield.text = RealmManager.sharedInstance.get(object: self.organizers)[0].records[0].name
        }
        self.organizerTextfield.resignFirstResponder()
        self.typeTextfield.becomeFirstResponder()
    }

    @objc func tapDoneType() {
        if typeTextfield.text == "" {
            self.typeTextfield.text = RealmManager.sharedInstance.get(object: self.types)[0].records[0].type
        }
        self.typeTextfield.resignFirstResponder()
        self.infoTextview.becomeFirstResponder()
    }
    
    // put\post mothods
    func addEdit() {

        guard let name = nameGameTextfield.text else {return}
        guard let date = dateGameTextfield.text else {return}
        guard let info = infoTextview.text else {return}
        
        let datas = ["date": date , "typeId": type ?? 25, "name" : name,  "organizerId": organizer ?? 1, "info": info] as [String : Any]

        if id != nil {
            
            let link = "\(URLs().deleteURL)\(String(describing: id!) + "/")"
            
            EventSetup.asyncResponse(link, method: .put, parameters: datas, header: EventSetup.PostPutHeader) {
            }
           
            
        } else {
            
            let link = "\(URLs().deleteURL)"
            
            EventSetup.asyncResponse(link, method: .post, parameters: datas, header: EventSetup.PostPutHeader) {
            }
            
        }
    }
    
    // tap button "Сохранить"
    @objc func postDateForBackend(sender: UIButton) {
        
        let dateDate = NSDate()
        let dateString = String()
        let dates = dateString.dateFormatForDate(date: dateGameTextfield.text ?? "2025-12-12")
        
        let alertString = AlertView()
        if nameGameTextfield.text == "" || dateGameTextfield.text == "" || typeTextfield.text == "" || organizerTextfield.text == "" {
  
            self.present(alertString.alertView("Заполните все поля!"), animated: true, completion: nil)
            
        } else if dates > dateDate as Date {

            let status = Reach().connectionStatus()

            switch status {
            case .unknown, .offline:
                self.present(alertString.alertView("Нет подключения к сети!"), animated: true, completion: nil)
            case .online(.wwan):
                addEdit()
                self.navigationController?.popViewController(animated: true)
            case .online(.wiFi):
                addEdit()

                self.navigationController?.popViewController(animated: true)
            }
            
        } else if datePicker.date <= dateDate as Date {
            self.present(alertString.alertView("Неверная дата!"), animated: true, completion: nil)
        }
    }
    // next textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameGameTextfield {
           textField.resignFirstResponder()
            dateGameTextfield.becomeFirstResponder()
        }
       return true
      }
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // extention from AddEventViewLayout
        attributes()
        // extention from AddEventPicker
        extetionPicker()
        // scroll with keyboard
        registerForKeyboardNotification()
        // close keyboard
        addTapGestureToHideKeyboard()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // removeObserver
        NotificationCenter.default.removeObserver(self)
    }
}
