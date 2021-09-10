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
        private let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.register(TeamMenuCollectionViewCell.self, forCellWithReuseIdentifier: "teamMenuCell")
            
            return cv
        }()

        
        
        
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
