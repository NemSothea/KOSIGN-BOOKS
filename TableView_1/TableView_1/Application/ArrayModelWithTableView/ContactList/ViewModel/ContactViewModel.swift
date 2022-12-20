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
        
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 291 1234", contact_name: "Pha Vansa", profile_img: "contact_0", rowType: .Profile)))
        contactCells.append(ContactModel<Any>(value: ContactInfo(phone_number: "010 432 4321", contact_name: "Lim Seudy", profile_img: "contact_1", rowType: .Profile)))
        
    }
    
}
