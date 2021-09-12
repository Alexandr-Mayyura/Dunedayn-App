//
//  EventBase.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation

//struct EventBase :  {
//
//	let events : [Events]?
//
//	enum CodingKeys: String, CodingKey {
//
//		case events = "events"
//	}
//
//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		events = try values.decodeIfPresent([Events].self, forKey: .events)
//	}
//
//}

struct EventBase : Codable {
    let events : [Events]?

    enum CodingKeys: String, CodingKey {

        case events = "events"
    }

    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            events = try values.decodeIfPresent([Events].self, forKey: .events)
        }

}
