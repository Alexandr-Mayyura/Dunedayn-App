//
//  EventSetup.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation
import Alamofire

class EventSetup {

    func asyncGetRequest<T: Decodable>(_ URlString: String, completion: @escaping ((T) -> ())) {

        AF.request(URlString).responseJSON { respons in
            guard let data = respons.data else { return }
                do {
                    let datas = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(datas)
                    }
                    } catch let error {
                    print(error)
                    }
                }
            }
}
