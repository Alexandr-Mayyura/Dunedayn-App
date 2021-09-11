//
//  EventSetup.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation
import Alamofire

class EventSetup {

    func asyncGetRequest<T: Decodable> (_ URlstring: String, model: T.Type, completion: @escaping (T) -> Void) {

        AF.request(URlstring).responseJSON { respons in
            guard let data = respons.data else { return }
                do {
                    let datas = try JSONDecoder().decode(model, from: data)
                    let parseData: T = datas
                    DispatchQueue.main.async {
                        completion(parseData)
                    }
                    } catch let error {
                    print(error)
                    }
                }
            }
}
