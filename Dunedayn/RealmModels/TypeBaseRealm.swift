//
//  TypeBaseRealm.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.10.2021.
//

import Foundation
import RealmSwift

class TypeBase: Object, Codable {
    var records = RealmSwift.List<Types>()
    @objc dynamic var total : Int = 0
    @objc dynamic var id: Int = 0
    
    override static func primaryKey() -> String? {
          return "id"
      }
//    override static func primaryKey() -> String? {
//          return "total"
//      }

    enum CodingKeys: String, CodingKey {

        case records = "records"
        case total = "total"
        
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decode(Int.self, forKey: .total)
        let type = try values.decodeIfPresent([Types].self, forKey: .records) ?? [Types()]
        records.append(objectsIn: type)
    }

}
