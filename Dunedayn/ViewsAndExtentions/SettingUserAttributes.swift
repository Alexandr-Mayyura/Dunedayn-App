//
//  SettingUserAttributes.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 03.11.2021.
//

import Foundation
import UIKit
import SDWebImage

extension SettingUserViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }
    
    func showImagePickerOptions() {
        let alertVC = UIAlertController(title: "Добавить фото", message: "Выберите фотографию", preferredStyle: .actionSheet)
        
//        let cameraAction = UIAlertAction(title: "Камера", style: .default) { [weak self] (action) in
//            guard let self = self  else { return }
//            let cameraImagePicker = self.imagePicker(sourceType: .camera)
//            cameraImagePicker.delegate = self
//            self.present(cameraImagePicker, animated: true, completion: nil)
//        }
            
        let libraryAction = UIAlertAction(title: "Библиотека", style: .default) { [weak self] (action) in
            guard let self = self  else { return }
            let libraryImagePicker = self.imagePicker(sourceType: .photoLibrary)
            libraryImagePicker.delegate = self
            self.present(libraryImagePicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        
//        alertVC.addAction(cameraAction)
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)
        
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    func saveImage (image: UIImage, path: String ) -> Bool{

        let pngImageData = image.pngData()! as NSData
//        let jpgImageData = image.jpegData(compressionQuality: 1.0)! as NSData
        let result = pngImageData.write(toFile: path, atomically: true)
        return result
    }
    
    func documentsDirectory() -> String {
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        return documentsFolderPath!
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        return documentsDirectory().appending(filename)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let tempImage = info[.originalImage] as! UIImage
        let pngImageData = tempImage.pngData()! as NSData
        pngImageData.write(toFile: fileInDocumentsDirectory(filename: "/tempImage"), atomically: true)
        print(fileInDocumentsDirectory(filename: "/tempImage"))
        userImage.image = tempImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: path)

            if image == nil {

                print("missing image at: (path)")
            }
            print("\(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
            return image
    }
    
    
    func attributes() {
        
        let image = BackgroundImages()
        image.backgraundImage.image = image.image
        view.insertSubview(image.backgraundImage, at: 0)
        
        let color = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.85)
        
        substrate.backgroundColor = color
        substrate.layer.cornerRadius = 10
        substrate.translatesAutoresizingMaskIntoConstraints = false
        
        userImage.frame = CGRect(x: view.bounds.width/2 - 100, y: 30, width: 200, height: 200)
        
        userImage.tintColor = .darkGray
        userImage.backgroundColor = .clear
        userImage.layer.cornerRadius = 10
        userImage.clipsToBounds = true
        userImage.contentMode = .scaleAspectFill
        userImage.backgroundColor = UIColor(patternImage: UIImage(systemName: "camera.viewfinder")!)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.tintColor = .white
        addImageButton.backgroundColor = .clear
        addImageButton.titleLabel?.font = UIFont.init(name: "Helvetica Neue", size: 20)
        addImageButton.setTitle("Добавить фото", for: .normal)
        
        myNameLabel.translatesAutoresizingMaskIntoConstraints = false
        myNameLabel.backgroundColor = color
        myNameLabel.layer.cornerRadius = 10
        myNameLabel.clipsToBounds = true
        myNameLabel.textColor = .white
        myNameLabel.font = UIFont.init(name: "Helvetica Neue", size: 30)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = .white
        nameLabel.font = UIFont.init(name: "Helvetica Neue", size: 26)
        nameLabel.text = "Имя:"
        
        renameButton.translatesAutoresizingMaskIntoConstraints = false
        let renameView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        renameView.image = UIImage(systemName: "highlighter")
        renameView.tintColor = .white
        renameButton.addSubview(renameView)
//        let name = RealmManager.sharedInstance.get(object: self.name)
//        self.title = name[0].name
        
        view.addSubview(substrate)
        view.addSubview(userImage)
        view.addSubview(addImageButton)
        view.addSubview(myNameLabel)
        view.addSubview(renameButton)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            substrate.topAnchor.constraint(equalTo: userImage.topAnchor, constant: -5),
            substrate.leftAnchor.constraint(equalTo: userImage.leftAnchor, constant: -5),
            substrate.rightAnchor.constraint(equalTo: userImage.rightAnchor, constant: 5),
            substrate.bottomAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 5),
        
            addImageButton.topAnchor.constraint(equalTo: substrate.bottomAnchor, constant: 10),
            addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            myNameLabel.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 40),
            myNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            renameButton.leftAnchor.constraint(equalTo: myNameLabel.rightAnchor, constant: 15),
            renameButton.centerYAnchor.constraint(equalTo: myNameLabel.centerYAnchor, constant: 5),
            
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            nameLabel.centerYAnchor.constraint(equalTo: myNameLabel.centerYAnchor, constant: 0)
            
        ])
        
    }
}
