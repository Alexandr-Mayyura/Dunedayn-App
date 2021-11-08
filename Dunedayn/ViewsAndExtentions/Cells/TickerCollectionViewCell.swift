//
//  TickerCollectionViewCell.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 31.10.2021.
//

import UIKit

class TickerCollectionViewCell: UICollectionViewCell {
    
    var tickerNameLabel: UILabel?
    var logoImage: UIImageView?


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tickerNameLabel = UILabel(frame: CGRect(x: 1, y: 2, width: contentView.bounds.size.width, height: contentView.bounds.size.height))
        tickerNameLabel?.textColor = .white
        tickerNameLabel?.textAlignment = .center
        tickerNameLabel?.numberOfLines = 0
        tickerNameLabel?.font = tickerNameLabel?.font.withSize(12)
        contentView.addSubview(tickerNameLabel!)
        
     
        logoImage = UIImageView(frame: CGRect(x: 170, y: 0, width: 50, height: contentView.bounds.size.height))
        logoImage?.contentMode = .scaleAspectFit
        contentView.addSubview(logoImage!)
        
    }
    
   

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
