//
//  EventSetup.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 09.09.2021.
//

import Foundation
import Alamofire

class EventSetup{

    func asyncGetPostRequest<T>(_ URlString: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (T) -> Void) where T: Codable {

        AF.request(URlString, method: method, parameters: parameters,  encoding: JSONEncoding.default).responseData(completionHandler: { respons in
            guard let data = respons.data else { return }
            
                do {
                    let datas = try JSONDecoder().decode(T.self, from: data)
                   
                    DispatchQueue.main.async {
                        completion(datas)
                    }
                    } catch let error {
                    print(error)
                    }
                })
            }
}
//switch response.result {
//            case .success(let res):
//                if let code = response.response?.statusCode {
//                    switch code {
//                    case 200...299:
//                        do {
//                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
//                        } catch let error {
//                            print(error)
//                            completion(.failure(error))
//                        }
//                    default:
//                        print("error")
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
