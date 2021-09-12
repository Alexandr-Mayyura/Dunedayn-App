//
//  Events.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct Events : Codable {
    
	let id : Int?
	let date : String?
	let type : String?
	let name : String?
	let organizerid : Int?
	let weight : Int?
	let info : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case date = "date"
		case type = "type"
		case name = "name"
		case organizerid = "organizerid"
		case weight = "weight"
		case info = "info"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		organizerid = try values.decodeIfPresent(Int.self, forKey: .organizerid)
		weight = try values.decodeIfPresent(Int.self, forKey: .weight)
		info = try values.decodeIfPresent(String.self, forKey: .info)
	}

}
