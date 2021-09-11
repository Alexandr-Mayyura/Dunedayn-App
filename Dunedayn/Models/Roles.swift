//
//  Roles.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct Roles : Codable {
	let id : Int?
	let memberRole : String?
	let roleDate : String?
	let userId : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case memberRole = "memberRole"
		case roleDate = "roleDate"
		case userId = "userId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		memberRole = try values.decodeIfPresent(String.self, forKey: .memberRole)
		roleDate = try values.decodeIfPresent(String.self, forKey: .roleDate)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
	}

}
