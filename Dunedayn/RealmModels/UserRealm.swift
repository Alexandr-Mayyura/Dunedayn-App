//
//  UserRealm.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 05.11.2021.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var name: String?
    @objc dynamic var id: Int = 0
    
    override static func primaryKey() -> String? {
          return "id"
      }
}
