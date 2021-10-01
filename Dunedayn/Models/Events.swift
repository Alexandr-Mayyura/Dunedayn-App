//
//  Events.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct Events : Codable {
    let date : String?
    let id : Int?
    let info : String?
    let name : String?
    let organizerId : Int?
    let typeId : Int?

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case id = "id"
        case info = "info"
        case name = "name"
        case organizerId = "organizerId"
        case typeId = "typeId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        info = try values.decodeIfPresent(String.self, forKey: .info)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        organizerId = try values.decodeIfPresent(Int.self, forKey: .organizerId)
        typeId = try values.decodeIfPresent(Int.self, forKey: .typeId)
    }

}
