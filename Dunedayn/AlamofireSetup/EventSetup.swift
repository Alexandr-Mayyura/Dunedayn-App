//
//  EventSetup.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation
import Alamofire

class EventSetup {

    func asyncGetRequest (completion: @escaping ([EventBase]) -> Void) {

        AF.request("https://dunedayn-app.herokuapp.com/api/events/all/").responseJSON { respons in
            guard let data = respons.data else { return }
                do {
                    let eventData = try JSONDecoder().decode(EventBase.self, from: data)
                    let events: [EventBase] = [eventData]
                    DispatchQueue.main.async {
                        completion(events)
                    }
                    } catch let error {
                    print(error)
                    }
                }
            }
}
