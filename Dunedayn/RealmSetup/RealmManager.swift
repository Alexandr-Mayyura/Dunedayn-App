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
    
    // Общий экземпляр менеджера realm
    static let sharedInstance = RealmManager()
    
   // Частный инициализатор для realm. Вылетает, если не может открыть базу данных.
    private init() {
        do {
            database = try Realm()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // Извлекает данный тип объекта из базы данных.
  
    // Объект параметра: тип объекта для извлечения.
    
    public func get<T: Object>(object: T) -> Results<T> {
        let result: Results<T> = database.objects(T.self)
        return result
    }
    
    // Записывает данный объект в базу данных.
    // Пользовательская обработка ошибок доступна как параметр закрытия (по умолчанию просто возвращается).
 
    public func save<T: Object>(object: T) {
       
            try! database.write {
                database.add(object, update: .all)
            }
    }
    
    // Заменяет указанный объект в базе данных, если он существует. Если нет, он запишет его как новый объект.
    // Пользовательская обработка ошибок доступна как параметр закрытия (по умолчанию просто возвращается).
  
    public func update<T: Object>(object: T, errorHandler: @escaping ((_ error : Swift.Error) -> Void) = { _ in return }) {
        do {
            try database.write {
                database.add(object, update: .all)
            }
        }
        catch {
            errorHandler(error)
        }
    }
    
    /// Deletes the given object from the database if it exists.
    /// Custom error handling available as a closure parameter (default just returns).
  
    public func delete<T: Object>(object: T)  {
      
            try! database.write {
                database.delete(object)
            }
    }
    
    // Deletes all existing data from the database. This includes all objects of all types.
    // Custom error handling available as a closure parameter (default just returns).
  
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

