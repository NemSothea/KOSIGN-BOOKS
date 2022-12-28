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
        
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 291 1234", contact_name: "Locas V", neck_name: "@locas", profile_img: "contact_5", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 432 4321", contact_name: "សុភាពបុរសក្លែងក្លាយ",neck_name: "@kd", profile_img: "contact_0", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 929 3030", contact_name: "សុភាពបុរស",neck_name: "@seudy", profile_img: "contact_1", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 415 1223", contact_name: "បងក្លូរកុច",neck_name: "@kochkoch", profile_img: "contact_2", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 789 2365", contact_name: "សើចច្រើនចំរើនជ្រួញ",neck_name: "@tra", profile_img: "contact_3", rowType: .Contact)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 789 2365", contact_name: "ចេញក៏ដឹងចូលក៏ដឹង",neck_name: "@honghong", profile_img: "contact_4", rowType: .Contact)))
        
    }
    
}
