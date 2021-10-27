//
//  UserMenuViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 27.10.2021.
//

import UIKit

class UserMenuViewController: UIViewController {
    
    let teamMenu = ["Статистика",  "Игры", "Кит лист", "Калькулятор", "Чек лист", "Заказы"]

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TeamMenuCollectionViewCell.self, forCellWithReuseIdentifier: "teamMenuCell")
            
        return cv
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        attributes()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension UserMenuViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return teamMenu.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamMenuCell", for: indexPath) as! TeamMenuCollectionViewCell
        cell.backgroundColor = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.90)
        cell.layer.cornerRadius = 10
        
        let nameMenu = teamMenu[indexPath.row]
        cell.menuNameLabel?.text = nameMenu
        
        return cell
    }

     func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.1) {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.transform = .init(scaleX: 0.90, y: 0.90)
                cell.contentView.backgroundColor = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 1)
            }
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.1) {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.transform = .identity
                cell.contentView.backgroundColor = .clear
                
            }
            if indexPath.row == 1 {
                 let vc = CalendarViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}




