//
//  AddEventViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 12.09.2021.
//

import UIKit



class AddEventViewController: UIViewController, UITextFieldDelegate, OrgPickerViewProtocol, TypePickerViewProtocol {

    var organizers = [OrganizerBase]()
    var types = [TypeBase]()

    func idOrg(selectedRowValue: Int?) {
        organizer = selectedRowValue
    }
    
    func orgPickerDidSelectRow(selectedRowValue: String?) {
        organizerTextfield.text = selectedRowValue
    }
    func typePickerDidSelectRow(selectedRowValue: String?) {
        typeTextfield.text = selectedRowValue
    }
    
    func myIdType(selectedRowValue: Int?) {
        type = selectedRowValue
    }

    let organizerPicker = UIPickerView()
    let datePicker = UIDatePicker()
    let typePicker = UIPickerView()
    
    var toolBar : UIToolbar = {
        var toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        return toolBar
    }()
    
    var dateToolBar : UIToolbar = {
        var toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        return toolBar
    }()
    
    var typeToolBar : UIToolbar = {
        var toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        return toolBar
    }()
    
    
    var name: String?
    var date: String?
    var organizer : Int?
    var info: String?
    var weight: Int?
    var id: Int?
    var type: Int?
    var typeName: String?
    var organName: String?
    
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
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Сохранить", for: .normal)
        bt.backgroundColor = .systemGray
        bt.layer.cornerRadius = 8
        return bt
    }()

    //  datePicker method
    @objc func tapDoneDate() {
        if let datePicker = self.dateGameTextfield.inputView as? UIDatePicker {

            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU_POSIX")
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateString = dateFormatter.string(from: datePicker.date)
            self.dateGameTextfield.text = dateString
        }
        self.dateGameTextfield.resignFirstResponder()
        self.organizerTextfield.becomeFirstResponder()
    }
    
    let screenWidth = UIScreen.main.bounds.width

    @objc func tapCancel() {
        self.organizerTextfield.text = ""
        self.organizerTextfield.resignFirstResponder()
    }
    
    @objc func tapDoneOrganizer() {
        if organizerTextfield.text == "" {
        self.organizerTextfield.text = organizers[0].records?[0].name
        }
        self.organizerTextfield.resignFirstResponder()
        self.typeTextfield.becomeFirstResponder()
    }
    
    @objc func tapCancelType() {
        self.typeTextfield.text = ""
        self.typeTextfield.resignFirstResponder()
    }
    
    @objc func tapDoneType() {
        if typeTextfield.text == "" {
        self.typeTextfield.text = types[0].records?[0].type
        }
        self.typeTextfield.resignFirstResponder()
        self.infoTextview.becomeFirstResponder()
    }
    
    func addEdit() {
        
        name = nameGameTextfield.text!
        date = dateGameTextfield.text!
        info = infoTextview.text!
        organName = organizerTextfield.text!
        
        let datas = ["date": date ?? "2022-10-10", "typeId": type ?? 25, "name" : name ?? "Название игры",  "organizerId": organizer ?? 1, "info": info ?? "Информация"] as [String : Any]

        if id != nil {
            
            let link = "\(URLs().deleteURL)\(String(describing: id!) + "/")"
            
            EventSetup.asyncResponse(link, method: .put, parameters: datas, header: EventSetup.PostPutHeader) {
                print("PUT")
            }
        } else {
            
            let link = "\(URLs().deleteURL)"
            
            EventSetup.asyncResponse(link, method: .post, parameters: datas, header: EventSetup.PostPutHeader) {
                print("post")
                print(datas)
            }
        }
    }
    
    func addOrganizer() {
        EventSetup.asyncRequest(URLs().orgUrl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: OrganizerBase) in
            self?.organizers = [result]
            self?.organizerPickerView.organizer = self!.organizers
        }
    }
    
    func addType() {
        EventSetup.asyncRequest(URLs().typeURL, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: TypeBase) in
            self?.types = [result]
            self?.typePickerView.typeEvent = self!.types
        }
    }
    
    // post/edit data
    @objc func postDateForBackend(sender: UIButton) {
        let date = NSDate()
        if nameGameTextfield.text == "" || dateGameTextfield.text == "" || typeTextfield.text == "" || organizerTextfield.text == "" {
            
            let av = UIAlertController(title: "Заполните все поля!", message: "", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
            
            av.addAction(cancelAction)
            self.present(av, animated: true, completion: nil)
            
        } else if datePicker.date <= date as Date {
                let av = UIAlertController(title: "Неверная дата!", message: "", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
                
                av.addAction(cancelAction)
                self.present(av, animated: true, completion: nil)
        } else {
            
        addEdit()
        self.navigationController?.popViewController(animated: true)
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameGameTextfield {
           textField.resignFirstResponder()
            dateGameTextfield.becomeFirstResponder()
        }
       return true
      }
    
    var organizerPickerView: OrganozerPickerView!
    var typePickerView: TypePickerView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameGameTextfield.delegate = self
        
        addOrganizer()
        addType()
        
        typePickerView = TypePickerView()
        typePickerView.typeDelegate = self
        typePicker.dataSource = typePickerView
        typePicker.delegate = typePickerView
        
        let doneButtonType = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneType))
        let spaceButtonType = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButtonType = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancelType))
        typeToolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        typeToolBar.setItems([cancelButtonType, spaceButtonType, doneButtonType], animated: false)
        
        typeTextfield.inputView = typePicker
        typeTextfield.inputAccessoryView = typeToolBar

        organizerPickerView = OrganozerPickerView()
        organizerPickerView.delgate = self
        organizerPicker.dataSource = organizerPickerView
        organizerPicker.delegate = organizerPickerView
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneOrganizer))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancel))
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        organizerTextfield.inputView = organizerPicker
        organizerTextfield.inputAccessoryView = toolBar
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
                
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneDate))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        dateToolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        dateToolBar.setItems([cancel, flexible, barButton], animated: false)
        
        dateGameTextfield.inputView = datePicker
        dateGameTextfield.inputAccessoryView = dateToolBar

        self.title = "Добавьте игру"
        
        positionViews()

        // scroll with keyboard
        
            registerForKeyboardNotification()
        // close keyboard
            addTapGestureToHideKeyboard()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
