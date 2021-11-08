//
//  TeamMenuCollectionViewCell.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class TeamMenuCollectionViewCell: UICollectionViewCell {

    var menuNameLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        menuNameLabel = UILabel(frame: CGRect(x: contentView.bounds.size.height/2 - contentView.bounds.size.height/2.2, y: contentView.bounds.size.height/2 - contentView.bounds.size.height/4.5, width: contentView.bounds.size.width, height: 40))
        
        
        menuNameLabel?.textColor = .white
        menuNameLabel?.textAlignment = .center
        menuNameLabel?.font = menuNameLabel?.font.withSize(32)
        
        contentView.addSubview(menuNameLabel!)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
