//
//  OrderView.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/03/20.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
            }
        }
        Section {
            NavigationLink("Place Order") {
                CheckoutView()
            }
        }
        .navigationTitle("Order")
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
