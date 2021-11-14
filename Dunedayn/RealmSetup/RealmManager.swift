//
//  RealmManager.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 24.10.2021.
//

import Foundation
import RealmSwift
import Alamofire

public class RealmManager {
    private let database: Realm
    
    // singleton
    static let sharedInstance = RealmManager()
    
   // инициализатор для realm
    private init() {
        do {
            database = try Realm()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
    //извлечь данные
    public func get<T: Object>(object: T) -> Results<T> {
        let result: Results<T> = database.objects(T.self)
        return result
    }
    
    // записать данные
    public func save<T: Object>(object: T) {
       
            try! database.write {
                database.add(object, update: .all)
            }
    }
    
    // удалить объект
    public func delete<T: Object>(object: T)  {
      
            try! database.write {
                database.delete(object)
            }
    }
    
    // удалить все
    public func deleteAll(errorHandler: @escaping ((_ error : Swift.Error) -> Void) = { _ in return }) {
        do {
            try database.write {
                database.deleteAll()
            }
        }
        catch {
            errorHandler(error)
        }
    }
}
   
