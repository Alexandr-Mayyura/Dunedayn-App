//
//  AddEventViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 12.09.2021.
//

import UIKit

class AddEventViewController: UIViewController {
    
    
    let nameGameTextfield = UITextField()
    let dateGameTextfield = UITextField()
    let organizerTextfield = UITextField()
    let discriptionTextview = UITextView()
    let scrollView = UIScrollView()
    let secondView = UIView()
    let addButton : UIButton = {
        let bt = UIButton()
//        bt.addTarget(self, action: #selector(addDataFirebase), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Сохранить", for: .normal)
        bt.backgroundColor = .systemGray
        bt.layer.cornerRadius = 8
        return bt
    }()

    
    func positionViews() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        nameGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        dateGameTextfield.translatesAutoresizingMaskIntoConstraints = false
        organizerTextfield.translatesAutoresizingMaskIntoConstraints = false
        discriptionTextview.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(secondView)
        secondView.addSubview(dateGameTextfield)
        secondView.addSubview(nameGameTextfield)
        secondView.addSubview(organizerTextfield)
        secondView.addSubview(discriptionTextview)
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
            
            discriptionTextview.topAnchor.constraint(equalTo: organizerTextfield.bottomAnchor, constant: 20),
            discriptionTextview.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -30),
            discriptionTextview.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 30),
            
            addButton.topAnchor.constraint(equalTo: discriptionTextview.bottomAnchor, constant: 30),
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
        
        discriptionTextview.font = .systemFont(ofSize: 20)
        discriptionTextview.layer.cornerRadius = 8
        discriptionTextview.autocorrectionType = .no
        discriptionTextview.keyboardType = .default
        discriptionTextview.returnKeyType = .done
        discriptionTextview.scrollIndicatorInsets = .zero
        discriptionTextview.textColor = .black
        discriptionTextview.backgroundColor = .white
        discriptionTextview.isScrollEnabled = false
        
    // scroll with keyboard
        registerForKeyboardNotification()
    // close keyboard
        addTapGestureToHideKeyboard()
    }
    
    // MARK: - scroll with keyboard
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Добавьте игру"
        positionViews()
    }
    

  

}
