////
////  OrganizerBase.swift
////  Dunedayn
////
////  Created by Aleksandr Mayyura on 09.09.2021.
////
//
//import Foundation
//
//
//let orgUrl = ""
//
//import Foundation
//
//struct OrganizerBase : Codable {
//    let records : [Organizer]?
//    let total : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case records = "records"
//        case total = "total"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        records = try values.decodeIfPresent([Organizer].self, forKey: .records)
//        total = try values.decodeIfPresent(Int.self, forKey: .total)
//    }
//
//}
//
