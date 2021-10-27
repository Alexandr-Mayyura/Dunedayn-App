//
//  EventsViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import UIKit

class EventsViewController: UIViewController, UITextViewDelegate {

    let scrollView = UIScrollView()
    let firstView = UIView()
    let dateLabel = UILabel()
    let nameLabel = UILabel()
    let typeOrganizerLabel = UILabel()
    let infoTextview = UITextView()
    
    var date: String?
    var name: String?
    var type: String?
    var info: String?
    var organazerName: String?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTextview.delegate = self
        
        self.title = name
        
        nameLabel.text = " \(name ?? "")   "
        infoTextview.text = info
        dateLabel.text = " \(date ?? "")   "
        typeOrganizerLabel.text = " \(type ?? "") / \(organazerName ?? "")   "
    }
}


