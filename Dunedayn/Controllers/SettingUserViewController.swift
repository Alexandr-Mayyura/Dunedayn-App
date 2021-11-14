//
//  SettingUserViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 03.11.2021.
//

import UIKit
import SDWebImage

class SettingUserViewController: UIViewController {
    
    let name = User()
        
    var userImage = UIImageView()
    let substrate = UIView()
    let myNameLabel = UILabel()
    let nameLabel = UILabel()
     
    let renameButton : UIButton = {
       let bt = UIButton()
        bt.addTarget(self, action: #selector(newName), for: .touchUpInside)
        return bt
    }()
    
    let addImageButton : UIButton = {
        let bt = UIButton()
        bt.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        return bt
    }()
    
    let goToUserMenu : UIButton = {
        let bt = UIButton()
        bt.addTarget(self, action: #selector(goMenu), for: .touchUpInside)
        return bt
    }()
    
 
    
    
    
    @objc func goMenu(sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func newName(sender: UIButton) {
        
        self.present(AlertView().addNameAlertView("Измените Имя", myNameLabel), animated: true, completion: nil)
    }
    
    @objc func addImage(sender: UIButton) {
        showImagePickerOptions()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        attributes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if RealmManager.sharedInstance.get(object: name).count <= 0 {
            self.myNameLabel.text = ""
        } else {
            self.myNameLabel.text = RealmManager.sharedInstance.get(object: name)[0].name
        }

        self.userImage.image = ImageManager().loadImageFromPath(path: ImageManager().fileInDocumentsDirectory(filename: "/tempImage"))
        
        self.title = "Настройки профиля"
    }
}

