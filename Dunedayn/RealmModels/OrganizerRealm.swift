//
//  OrganizerRealm.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.10.2021.
//

import Foundation
import RealmSwift

class Organizer: Object, Codable {
    @objc dynamic var id : Int
    @objc dynamic var info : String?
    @objc dynamic var name : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case info = "info"
        case name = "name"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        info = try values.decodeIfPresent(String.self, forKey: .info)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//    }

}
