//
//  CountryModel.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/19/23.
//

import Foundation

struct CountryModel : Codable,Identifiable,Hashable {
    
    var id                  : String
    var countryName         : String
    var countryNameOne      : String
    var countryNameTwo      : String
    var countryNameThree    : String
    var correctCountry      : String
  
}

