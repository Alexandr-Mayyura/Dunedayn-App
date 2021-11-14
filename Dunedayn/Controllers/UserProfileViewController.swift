//
//  UserProfileViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.11.2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let user = User()
    
    let userImage = UIImageView()
    let userName = UILabel()
    let substrate = UIView()
    
    
 
    @objc func rightButtonAction(sender: UIBarButtonItem){
        let vc = SettingUserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        attributes()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .done, target: self, action: #selector (rightButtonAction))
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userName.text = RealmManager.sharedInstance.get(object: user).first?.name
        self.userImage.image = ImageManager().loadImageFromPath(path: ImageManager().fileInDocumentsDirectory(filename: "/tempImage"))
        
    }
    


}
