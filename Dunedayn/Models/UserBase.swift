//
//  UserBase.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct UserBase : Codable {
	let users : [Users]?

	enum CodingKeys: String, CodingKey {

		case users = "users"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		users = try values.decodeIfPresent([Users].self, forKey: .users)
	}

}
