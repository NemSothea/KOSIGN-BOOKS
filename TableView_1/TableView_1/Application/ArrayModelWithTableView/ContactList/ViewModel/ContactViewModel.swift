//
//  ContactViewModel.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/20.
//

import Foundation

class ContactViewModel {
    
    var contactCells : [ContactModel<Any>] = []
    
    func initContactCellData () {
        
        contactCells = []
        
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "0102911234", contact_name: "Locas V", neck_name: "@locas", profile_img: "contact_5", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "0104324321", contact_name: "សា សា",neck_name: "@kd", profile_img: "contact_0", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "0109293030", contact_name: "ឌី ឌី",neck_name: "@seudy", profile_img: "contact_1", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "0104151223", contact_name: "បងក្លូរកុច",neck_name: "@kochkoch", profile_img: "contact_2", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "0107892365", contact_name: "តា ត្រា",neck_name: "@tra", profile_img: "contact_3", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "0107892365", contact_name: "ហុង ប៊",neck_name: "@honghong", profile_img: "contact_4", rowType: .Contact)))
        
    }
    
}
