//
//  AddEventViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 12.09.2021.
//

import UIKit



class AddEventViewController: UIViewController, MyPickerViewProtocol {
    func myIdOrg(selectedRowValue: Int?) {
        organizer = selectedRowValue
    }
    
    func myPickerDidSelectRow(selectedRowValue: String?) {
        organizerTextfield.text = selectedRowValue
    }

    var calendarEvents = [EventBase]()
    var events = [Events]()
    var organizers = [OrganizerBase]()
   
    
    let organizerPicker = UIPickerView ()
    
    var toolBar : UIToolbar = {
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
    var type: String?
    var organName: String?
    
    let nameGameTextfield = UITextField()
    let dateGameTextfield = UITextField()
    let organizerTextfield = UITextField()
    let infoTextview = UITextView()
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
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            let dateString = dateFormatter.string(from: datePicker.date)
            self.dateGameTextfield.text = dateString
        }
        self.dateGameTextfield.resignFirstResponder()
    }
    
    let screenWidth = UIScreen.main.bounds.width
    
   
    
    @objc func tapCancel() {
        self.organizerTextfield.resignFirstResponder()
    }
    
    @objc func tapDoneOrganizer() {
        
        self.organizerTextfield.resignFirstResponder()
    }
    
    func addEdit() {
        
        name = nameGameTextfield.text!
        date = dateGameTextfield.text!
        info = infoTextview.text!
        type = "Game"
        organName = organizerTextfield.text!
        
        let datas = ["date": date!, "type": type!, "name" : name!,  "organizerId": organizer ?? 1, "info": info!] as [String : Any]

        if id != nil {
            let link = "\(URLs().deleteURL)\(String(describing: id!) + "/")"
            
            EventSetup.asyncRequest(link, method: .put, parameters: datas, header: EventSetup.PostPutHeader) { (result: Events) in
                
                    }
            print("PUT")
            
        } else {
            
            let link = "\(URLs().deleteURL)"
         
            EventSetup.asyncRequest(link, method: .post, parameters: datas, header: EventSetup.PostPutHeader) { (result: EventBase) in
                
                }
        }
    }
    
    func addOrganizer() {
        EventSetup.asyncRequest(URLs().orgUrl, method: .get, parameters: nil, header: EventSetup.GetDeleteHeader)  { [weak self] (result: OrganizerBase) in
            self?.organizers = [result]
            self?.organizerPickerView.organizer = self!.organizers

        }
        
    }
    // post/edit data
    @objc func postDateForBackend(sender: UIButton) {
       
        addEdit()
        self.navigationController?.popViewController(animated: true)

    }
    
    
    var organizerPickerView: OrganozerPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addOrganizer()

        organizerPickerView = OrganozerPickerView()
        organizerPickerView.delgate = self
//        organizerPicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 250)
        organizerPicker.dataSource = organizerPickerView
        organizerPicker.delegate = organizerPickerView
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tapDoneOrganizer))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tapCancel))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)

        
        
        organizerTextfield.inputView = organizerPicker
        organizerTextfield.inputAccessoryView = toolBar

        self.title = "Добавьте игру"
        
        positionViews()
        
        
        // scroll with keyboard
            registerForKeyboardNotification()
        // close keyboard
            addTapGestureToHideKeyboard()
    }
    
    // scroll with keyboard
        func registerForKeyboardNotification() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        @objc func keyboardWillShow(notification: NSNotification) {

            guard let userInfo = notification.userInfo else { return }
            var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)

            var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height + 20
            scrollView.contentInset = contentInset
        }

        @objc func keyboardWillHide(notification:NSNotification) {

            let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
        }
    
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
