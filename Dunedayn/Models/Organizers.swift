//
//  Organizers.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct Organizers : Codable {
	let id : Int?
	let name : String?
	let info : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case info = "info"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		info = try values.decodeIfPresent(String.self, forKey: .info)
	}

}
