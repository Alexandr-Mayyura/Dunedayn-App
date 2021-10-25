//
//  TypePickerView.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 29.09.2021.
//

import UIKit

protocol TypePickerViewProtocol {
    func typePickerDidSelectRow(selectedRowValue: String?)
    func myIdType(selectedRowValue: Int?)
    
}

class TypePickerView: UIPickerView {
    
    var typeDelegate: TypePickerViewProtocol?

    var typeEvent = TypeBase()
    
    let customWidth = 100
    let customHeight = 150

}

extension TypePickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return RealmManager.sharedInstance.get(object: self.typeEvent)[0].records.count
        
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return RealmManager.sharedInstance.get(object: self.typeEvent)[0].records[row].type
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        let nameType = RealmManager.sharedInstance.get(object: self.typeEvent)[0].records[row].type
        let idType = RealmManager.sharedInstance.get(object: self.typeEvent)[0].records[row].id
        
        typeDelegate?.myIdType(selectedRowValue: idType)
        typeDelegate?.typePickerDidSelectRow(selectedRowValue: nameType)
    }
    
}

