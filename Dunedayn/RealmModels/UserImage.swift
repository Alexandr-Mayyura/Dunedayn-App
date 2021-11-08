//
//  UserImage.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 07.11.2021.
//

import Foundation
import RealmSwift

class UserImage: Object, Codable {
    
    @objc dynamic var userImageUrl: String?
    @objc dynamic var id: Int = 0
    
    override static func primaryKey() -> String? {
          return "id"
      }
//    override static func primaryKey() -> String? {
//          return "userImageUrl"
//      }
}

