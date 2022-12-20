//
//  ContactModel.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/20.
//

import Foundation
enum RowType : String, CaseIterable {
    case Profile
    case Contact
}
struct ContactModel <T> {
    
    var value : T?
    
}
struct ContactInfo {
    
    var phone_number : String
    var contact_name : String
    var profile_img  : String
    var rowType      : RowType
    
}
