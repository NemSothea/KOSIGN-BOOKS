//
//  OrderView.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/03/20.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    
    var body: some View {
        Button("Order This") {
            
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
