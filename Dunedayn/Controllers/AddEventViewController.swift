//
//  AddEventViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 12.09.2021.
//

import UIKit



class AddEventViewController: UIViewController{

    var calendarEvents = [EventBase]()
    var events = [Events]()
    
    var name: String?
    var date: String?
    var organizer : Int?
    var info: String?
    var weight: Int?
    var id: Int?
    var type: String?
    
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
        @objc func tapDone() {
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

    // scroll with keyboard
        func registerForKeyboardNotification() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        @objc func keyboardWillShow(notification:NSNotification) {

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
    
    func addEdit() {
        
        name = nameGameTextfield.text!
        date = dateGameTextfield.text!
        info = infoTextview.text!
        organizer = 1
        type = "Game"

        let datas = ["date": date!, "type": type!, "name" : name!,  "organizerId": organizer!, "info": info!] as [String : Any]

        if id != nil {
            let link = "\(URLs().deleteURL)\(String(describing: id!) + "/")"
            
            EventSetup.asyncRequest(link, method: .put, parameters: datas, header: EventSetup.PostPutHeader) { (result: Events) in
                    }
            print("PUT")
            
        } else {
            
            let link = "\(URLs().deleteURL)"
         
            EventSetup.asyncRequest(link, method: .post, parameters: datas, header: EventSetup.PostPutHeader) { (result: EventBase) in
                }
            print("POST")
        }
    }
    // post/edit data
    @objc func postDateForBackend(sender: UIButton) {
       
        addEdit()
        self.navigationController?.popViewController(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Добавьте игру"
        positionViews()
    }
}

extension AddEventViewController {
    
    func positionViews() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        nameGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        dateGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        organizerTextfield.translatesAutoresizingMaskIntoConstraints = false
        infoTextview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(secondView)
        secondView.addSubview(dateGameTextfield)
        secondView.addSubview(nameGameTextfield)
        secondView.addSubview(organizerTextfield)
        secondView.addSubview(infoTextview)
        secondView.addSubview(addButton)

        secondView.backgroundColor = .gray
        view.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            secondView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            secondView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            secondView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
            
            nameGameTextfield.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 20),
            nameGameTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            nameGameTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            nameGameTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            dateGameTextfield.topAnchor.constraint(equalTo: nameGameTextfield.bottomAnchor, constant: 20),
            dateGameTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            dateGameTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            dateGameTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            organizerTextfield.topAnchor.constraint(equalTo: dateGameTextfield.bottomAnchor, constant: 20),
            organizerTextfield.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            organizerTextfield.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            organizerTextfield.heightAnchor.constraint(equalToConstant: 30),
            
            infoTextview.topAnchor.constraint(equalTo: organizerTextfield.bottomAnchor, constant: 20),
            infoTextview.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            infoTextview.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            
            addButton.topAnchor.constraint(equalTo: infoTextview.bottomAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            addButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 0)
        ])
        
        nameGameTextfield.placeholder = "Enter Name"
        
        nameGameTextfield.font = .systemFont(ofSize: 20)
        nameGameTextfield.borderStyle = .roundedRect
        nameGameTextfield.autocorrectionType = .no
        nameGameTextfield.keyboardType = .default
        nameGameTextfield.returnKeyType = .done
        nameGameTextfield.clearButtonMode = .whileEditing
        nameGameTextfield.contentVerticalAlignment = .center
        nameGameTextfield.textColor = .black
        nameGameTextfield.backgroundColor = .white
        
        dateGameTextfield.placeholder = "Enter Date"
        dateGameTextfield.font = .systemFont(ofSize: 20)
        dateGameTextfield.borderStyle = .roundedRect
        dateGameTextfield.autocorrectionType = .no
        dateGameTextfield.keyboardType = .default
        dateGameTextfield.returnKeyType = .done
        dateGameTextfield.clearButtonMode = .whileEditing
        dateGameTextfield.contentVerticalAlignment = .center
        dateGameTextfield.textColor = .black
        dateGameTextfield.backgroundColor = .white
        
        organizerTextfield.placeholder = "Enter Organizer"
        organizerTextfield.font = .systemFont(ofSize: 20)
        organizerTextfield.borderStyle = .roundedRect
        organizerTextfield.autocorrectionType = .no
        organizerTextfield.keyboardType = .default
        organizerTextfield.returnKeyType = .done
        organizerTextfield.clearButtonMode = .whileEditing
        organizerTextfield.contentVerticalAlignment = .center
        organizerTextfield.textColor = .black
        organizerTextfield.backgroundColor = .white
        
        infoTextview.font = .systemFont(ofSize: 20)
        infoTextview.layer.cornerRadius = 8
        infoTextview.autocorrectionType = .no
        infoTextview.keyboardType = .default
        infoTextview.returnKeyType = .done
        infoTextview.scrollIndicatorInsets = .zero
        infoTextview.textColor = .black
        infoTextview.backgroundColor = .white
        infoTextview.isScrollEnabled = false
        
    // scroll with keyboard
        registerForKeyboardNotification()
    // close keyboard
        addTapGestureToHideKeyboard()
        
        self.dateGameTextfield.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    
}
