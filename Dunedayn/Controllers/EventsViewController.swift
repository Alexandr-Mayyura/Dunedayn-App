//
//  EventsViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import UIKit

class EventsViewController: UIViewController {
    
    var dateLabel = EventLabel()
    var typeLabel = EventLabel()
    var nameLabel = EventLabel()
    var organizeridLabel = EventLabel()
    var weightLabel = EventLabel()
    
    var data = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        nameLabel = EventLabel(frame: CGRect(x: 100, y: 50, width: 100, height: 100))
        nameLabel.text = data
      
        view.addSubview(nameLabel)

        
    }
    

   

}
