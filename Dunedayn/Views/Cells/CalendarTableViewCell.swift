//
//  CalendarTableViewCell.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel?
    var dateLabel: UILabel?
    var myViewHeightConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        dateLabel = UILabel()
        
        contentView.addSubview(nameLabel!)
        contentView.addSubview(dateLabel!)
        
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        dateLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10) .isActive = true
        nameLabel?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -150) .isActive = true
        nameLabel?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10) .isActive = true
        nameLabel?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10) .isActive = true
        
        nameLabel?.numberOfLines = 0
        nameLabel?.textAlignment = .left
        nameLabel?.font = nameLabel?.font.withSize(20)
        
        dateLabel?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20) .isActive = true
        dateLabel?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10) .isActive = true
        dateLabel?.leadingAnchor.constraint(equalTo: nameLabel!.trailingAnchor, constant: 20) .isActive = true
        dateLabel?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20) .isActive = true
        
        dateLabel?.numberOfLines = 0
        dateLabel?.textAlignment = .center
        dateLabel?.font = nameLabel?.font.withSize(20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
