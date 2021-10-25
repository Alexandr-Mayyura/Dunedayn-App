//
//  EventsRealm.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.10.2021.

import Foundation
import RealmSwift

class Events: Object, Codable {
    @objc dynamic var date : String
    @objc dynamic var id : Int
    @objc dynamic var info : String?
    @objc dynamic var name : String
    @objc dynamic var organizerId : Int
    @objc dynamic var typeId : Int

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case id = "id"
        case info = "info"
        case name = "name"
        case organizerId = "organizerId"
        case typeId = "typeId"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        date = try values.decodeIfPresent(String.self, forKey: .date)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        info = try values.decodeIfPresent(String.self, forKey: .info)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        organizerId = try values.decodeIfPresent(Int.self, forKey: .organizerId)
//        typeId = try values.decodeIfPresent(Int.self, forKey: .typeId)
//    }

}


