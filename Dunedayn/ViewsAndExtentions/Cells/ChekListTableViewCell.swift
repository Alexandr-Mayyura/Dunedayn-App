//
//  ChekListTableViewCell.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 11.11.2021.
//

import UIKit

class ChekListTableViewCell: UITableViewCell {

    var nameLabel: UILabel?
    var myViewHeightConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()

        contentView.addSubview(nameLabel!)

        nameLabel?.translatesAutoresizingMaskIntoConstraints = false

        nameLabel?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10) .isActive = true
        nameLabel?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -180) .isActive = true
        nameLabel?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10) .isActive = true
        nameLabel?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10) .isActive = true
        
        nameLabel?.numberOfLines = 0
        nameLabel?.textAlignment = .left
        nameLabel?.textColor = .white
        nameLabel?.font = nameLabel?.font.withSize(22)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
