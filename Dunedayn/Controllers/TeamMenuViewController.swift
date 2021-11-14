//
//  TeamMenuViewController.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 10.09.2021.
//

import UIKit

class TeamMenuViewController: UIViewController {
    
    let teamMenu = ["Статистика", "Календарь", "Устав", "Казна", "Памятка"]
    
    let logosName = ["5У", "Линия Фронта", "Пыка (ATG)", "Разные орги с форума airsoftclub", "Совет Командиров СК", "СтрАтеГ (З.Л.О.)", "AirsoftClub2",    "Borgame (Бор)", "Privatka club", "Sokolgames", "Strike 37", "ДНД"]
    
    let vc = SingInViewController()
    
    let collectionViewMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.horizontalScrollIndicatorInsets = .zero
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TeamMenuCollectionViewCell.self, forCellWithReuseIdentifier: "teamMenuCell")
            
        return cv
    }()
    
    var collectionViewTicker: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.register(TickerCollectionViewCell.self, forCellWithReuseIdentifier: "tickerMenuCell")
               
           return cv
       }()
        
    var isOn = false
    func startScrolling(){
        if isOn == true {
            let co = collectionViewTicker.contentOffset.x
            let no = co + 1
            UIView.animate(withDuration: 0.03, delay: 0, options: .curveEaseInOut, animations: { [weak self]() -> Void in
                    self?.collectionViewTicker.contentOffset = CGPoint(x: no, y: 0)
                    }) { [weak self](finished) -> Void in
                        self?.startScrolling()
                   }
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionViewTicker.reloadData()
        isOn = true
        startScrolling()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        attributes()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewTicker.delegate = self
        collectionViewTicker.dataSource = self
        collectionViewMenu.delegate = self
        collectionViewMenu.dataSource = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       isOn = false
    }
}

extension TeamMenuViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewMenu {
            return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.width/4)
        } else {
            return CGSize(width: 200, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewMenu {
            return teamMenu.count
        } else if RealmManager.sharedInstance.get(object: self.vc.calendarEvents).count <= 0 {
           return 0
        } else {
            return RealmManager.sharedInstance.get(object: self.vc.calendarEvents)[section].records.count + 999
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         if collectionView == collectionViewMenu {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamMenuCell", for: indexPath) as! TeamMenuCollectionViewCell
         
             if indexPath.row == 1 {
                 cell.backgroundColor = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.90)
                 cell.layer.cornerRadius = 10
                 let nameMenu = teamMenu[indexPath.row]
                    cell.menuNameLabel?.text = nameMenu
             } else {
                 cell.menuNameLabel?.textColor = .systemGray
                 cell.backgroundColor = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 0.90)
                 cell.layer.cornerRadius = 10
                 let nameMenu = teamMenu[indexPath.row]
                 cell.menuNameLabel?.text = nameMenu
         }
        
        return cell
             
         } else {
                 
             let event  = RealmManager.sharedInstance.get(object: self.vc.calendarEvents)[indexPath.section].records[indexPath.row % RealmManager.sharedInstance.get(object: self.vc.calendarEvents)[indexPath.section].records.count]
             
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tickerMenuCell", for: indexPath) as! TickerCollectionViewCell
             cell.backgroundColor = .clear
             let dates = String()
             cell.tickerNameLabel?.text = "\(event.name) \n \(dates.datesFormatedInString(data: event.date))"
             
             let organ = RealmManager.sharedInstance.get(object: self.vc.organizers)[indexPath.section].records
             let itemId = event.organizerId
             var neededItem = Int()
             for (index, item) in organ.enumerated() {
                 if item.id == itemId {
                     neededItem = index
                 }
             }
             let org = organ[neededItem].name
             var imageName: String?
             for value in logosName{
                 imageName = value
                 
                 if org == imageName {
                    cell.logoImage?.image = UIImage(named: imageName!)
                }
             }
            return cell
         }
    }

     func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
         if collectionView == self.collectionViewMenu {
             if indexPath.row == 1{
                 UIView.animate(withDuration: 0.1) {
                     if let cell = collectionView.cellForItem(at: indexPath) {
                         cell.transform = .init(scaleX: 0.90, y: 0.90)
                         cell.contentView.layer.cornerRadius = 10
                         cell.contentView.backgroundColor = UIColor(red: 0.094, green: 0.094, blue: 0.051, alpha: 1)
                     }
                }
             }
         }
    }
    
     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
            if collectionView == self.collectionViewMenu {
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
}

