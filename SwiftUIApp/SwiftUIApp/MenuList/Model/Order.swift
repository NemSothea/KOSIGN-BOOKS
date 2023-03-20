//
//  Order.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/01/30.
//

import Foundation

class Order : ObservableObject {
    @Published var items = [MenuItem]()
    
    func add(item : MenuItem) {
        items.append(item)
    }
}
