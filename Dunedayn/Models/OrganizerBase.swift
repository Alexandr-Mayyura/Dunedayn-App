//
//  OrganizerBase.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

struct OrganizerBase : Codable {
    
	let organizers : [Organizers]?

	enum CodingKeys: String, CodingKey {

		case organizers = "organizers"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		organizers = try values.decodeIfPresent([Organizers].self, forKey: .organizers)
	}

}
