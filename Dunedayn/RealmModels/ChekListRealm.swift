//
//  ChekListRealm.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 11.11.2021.
//

import Foundation
import RealmSwift

class Task: Object {

    @objc dynamic var notes = ""
    @objc dynamic var isCompleted = false
    @objc dynamic var id: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
