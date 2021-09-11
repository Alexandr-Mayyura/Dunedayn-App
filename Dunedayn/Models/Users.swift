//
//  Users.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct Users : Codable {
	let id : Int?
	let callsign : String?
	let nametape : String?
	let currentRoleId : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case callsign = "callsign"
		case nametape = "nametape"
		case currentRoleId = "currentRoleId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		callsign = try values.decodeIfPresent(String.self, forKey: .callsign)
		nametape = try values.decodeIfPresent(String.self, forKey: .nametape)
		currentRoleId = try values.decodeIfPresent(Int.self, forKey: .currentRoleId)
	}

}
