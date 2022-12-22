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
        
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 291 1234", contact_name: "Locas V", next_name: "@locas", profile_img: "contact_5", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 432 4321", contact_name: "VansaPha",next_name: "@kd", profile_img: "contact_0", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 929 3030", contact_name: "Lim Seudy ",next_name: "@seudy", profile_img: "contact_1", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 415 1223", contact_name: " ",next_name: "@locas", profile_img: "contact_2", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 789 2365", contact_name: " ",next_name: "@locas", profile_img: "contact_3", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 789 2365", contact_name: " ",next_name: "@locas", profile_img: "contact_4", rowType: .Profile)))
        
    }
    
}
