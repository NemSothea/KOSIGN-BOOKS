//
//  User.swift
//  TestCombineSwift
//
//  Created by Bizplay on 2023/07/24.
//

import Foundation
/**
 - Define a model for user data
    1. The `User` struct represents the user data fetched from the API. It includes`id`, `name`, and `email` properties.
 */
struct User : Codable {
    let id      : Int
    let name    : String
    let email   : String
}
