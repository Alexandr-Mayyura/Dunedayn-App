//
//  EventBaseRealm.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.10.2021.
//

import Foundation
import RealmSwift

class EventBase: Object, Codable {
    var records = RealmSwift.List<Events>()
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
        
        let events = try values.decodeIfPresent([Events].self, forKey: .records) ?? [Events()]
        records.append(objectsIn: events)
    }

}
