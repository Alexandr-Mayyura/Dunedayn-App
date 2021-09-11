//
//  RolesBase.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct RolesBase : Codable {
	let roles : [Roles]?

	enum CodingKeys: String, CodingKey {

		case roles = "roles"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		roles = try values.decodeIfPresent([Roles].self, forKey: .roles)
	}

}
