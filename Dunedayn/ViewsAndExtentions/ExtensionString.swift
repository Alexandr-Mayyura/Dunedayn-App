//
//  ExtensionString.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 23.10.2021.
//

import Foundation

extension String {
    func datesFormated(data: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let data = dateFormatter.date(from: data)!
        dateFormatter.dateFormat = "d MMMM YYYY"
        dateFormatter.locale = .init(identifier: "ru_RU_POSIX")
        
        let dateForm = dateFormatter.string(from: data)
        return dateForm
    }
}
