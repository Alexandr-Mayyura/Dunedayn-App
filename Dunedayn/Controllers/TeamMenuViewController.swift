//
//  TeamMenuViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class TeamMenuViewController: UIViewController {
    
    let teamMenu = ["Статистика", "Календарь", "Устав", "Казна", "Памятка"]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TeamMenuCollectionViewCell.self, forCellWithReuseIdentifier: "teamMenuCell")
            
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewConstr()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.title = "Dunedayn"
    }
}

extension TeamMenuViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return teamMenu.count
       
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamMenuCell", for: indexPath) as! TeamMenuCollectionViewCell
        cell.backgroundColor = .darkGray
        cell.layer.cornerRadius = 10
        
        let nameMenu = teamMenu[indexPath.row]
        cell.menuNameLabel?.text = nameMenu
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
        let vc = CalendarViewController()
        navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TeamMenuViewController {
    
    func collectionViewConstr() {
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate (
            [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            ])
    }
}
