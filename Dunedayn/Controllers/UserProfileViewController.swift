//
//  UserProfileViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.11.2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let user = User()
    
    let userImageView = UIImageView()
    let userNameLabel = UILabel()
    let nameLabel = UILabel()
    let substrateView = UIView()
    
    
 
    @objc func rightButtonAction(sender: UIBarButtonItem){
        let vc = SettingUserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        attributes()
        nameLabel.text = "Имя:"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .done, target: self, action: #selector (rightButtonAction))
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = RealmManager.sharedInstance.get(object: user).first?.name
        userNameLabel.text = RealmManager.sharedInstance.get(object: user).first?.name
        self.userImageView.image = ImageManager().loadImageFromPath(path: ImageManager().fileInDocumentsDirectory(filename: "/tempImage"))
        
    }
    


}
