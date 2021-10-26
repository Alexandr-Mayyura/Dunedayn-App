//
//  EventSetup.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation
import Alamofire

class URLs {
    
    let eventURl = "https://dunedayn.ru/api/events/?offset=0&count=20"
    let deleteURL = "https://dunedayn.ru/api/events/"
    let orgUrl = "https://dunedayn.ru/api/organizers/"
    let typeURL = "https://dunedayn.ru/api/event_types/"
    
}


class EventSetup: NSObject{
    
    static let GetDeleteHeader: HTTPHeaders = ["Accept" : "application/json, */*; q=0.01"]
    static let PostPutHeader: HTTPHeaders = ["Accept" : "application/json, */*; q=0.01", "Content-Type" : "application/json; charset=UTF-8]"]
  
    static func asyncRequest<T: Codable>(_ URlString: String, method: HTTPMethod, parameters: Parameters?, header: HTTPHeaders?, completion: @escaping (T) -> Void) {
        
        AF.request(URlString, method: method, parameters: parameters,  encoding: JSONEncoding.default, headers: header).responseData { respons in
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
    
    static func asyncResponse(_ URlString: String, method: HTTPMethod, parameters: Parameters?, header: HTTPHeaders?, completion: @escaping () -> ()) {
        
        AF.request(URlString, method: method, parameters: parameters,  encoding: JSONEncoding.default, headers: header).responseData { respons in
   
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
