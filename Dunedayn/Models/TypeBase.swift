//
//  TypeBase.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 29.09.2021.
//

import Foundation

struct TypeBase : Codable {
    let records : [Type]?
    let total : Int?

    enum CodingKeys: String, CodingKey {

        case records = "records"
        case total = "total"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        records = try values.decodeIfPresent([Type].self, forKey: .records)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }

}
