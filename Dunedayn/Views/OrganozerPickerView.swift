//
//  OrganozerPickerView.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 25.09.2021.
//

import UIKit

protocol MyPickerViewProtocol {
    func myPickerDidSelectRow(selectedRowValue: String?)
    func myIdOrg(selectedRowValue: Int?)
    
}

class OrganozerPickerView: UIPickerView {
    
    var delgate: MyPickerViewProtocol?
    
    var organizer = [OrganizerBase]()
    
    let customWidth = 100
    let customHeight = 150
    
    
}

extension OrganozerPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return organizer[0].records!.count
        
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return organizer[0].records?[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        let nameOrg = organizer[0].records?[row].name
        let idOrg = organizer[0].records?[row].id
        
        delgate?.myIdOrg(selectedRowValue: idOrg)
        delgate?.myPickerDidSelectRow(selectedRowValue: nameOrg)
    }
    
}
