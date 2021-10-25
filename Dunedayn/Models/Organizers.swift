////
////  Organizers.swift
////  Dunedayn
////
////  Created by Aleksandr Mayyura on 09.09.2021.
////
//
//import Foundation
//
//struct Organizer : Codable {
//    let id : Int?
//    let info : String?
//    let name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case info = "info"
//        case name = "name"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        info = try values.decodeIfPresent(String.self, forKey: .info)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//    }
//
//}
