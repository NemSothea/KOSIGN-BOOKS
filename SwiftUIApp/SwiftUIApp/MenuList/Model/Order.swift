//
//  Order.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/01/30.
//

import Foundation

class Order : ObservableObject {
    @Published var items = [MenuItem]()
    
    var total : Int {
        if items.count > 0 {
            return items.reduce(0) {
                $0 + $1.price
            }
        }else {
            return 0
        }
    }
    
    func add(item : MenuItem) {
        items.append(item)
    }
    
//    func deleteItems(at offsets : IndexSet) {
//        order.items.remove(atOffsets: offsets)
//    }
}
