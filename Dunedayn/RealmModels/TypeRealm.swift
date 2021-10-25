//
//  TypeRealm.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.10.2021.
//

import Foundation
import RealmSwift

class Types: Object, Codable {
    @objc dynamic var id : Int
    @objc dynamic var type : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case type = "type"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//    }

}
