//
//  RealmManager.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 24.10.2021.
//

import Foundation
import RealmSwift

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
    
    // изменить данные
    public func update<T: Object>(object: T) {
   
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
    
    // Метод записи (поддерживает сохранение, обновление + удаление) для использования в асинхронных ситуациях. Логика записи передается через параметр закрытия.
    
    public func asyncWrite<T: ThreadConfined>(object: T, errorHandler: @escaping ((_ error : Swift.Error) -> Void) = { _ in return }, action: @escaping ((Realm, T?) -> Void)) {
        let threadSafeRef = ThreadSafeReference(to: object)
        let config = self.database.configuration
        DispatchQueue(label: "background").async {
            autoreleasepool {
                do {
                    let realm = try Realm(configuration: config)
                    let obj = realm.resolve(threadSafeRef)
                    
                    try realm.write {
                        action(realm, obj)
                    }
                }
                catch {
                    errorHandler(error)
                }
            }
        }
    }
}

