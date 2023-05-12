//
//  CheckoutView.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/04/12.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order : Order
    @State private var paymentType  = "Cash"
    let paymentTypes = ["Cash","Credit Card","iDine Points"]
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    var tipAmounts = [10,15,20,0]
    @State private var tipAmount = 15
    
//    var totalPrice : String {
//        let total = Double(order.t)
//    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                   
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID  ", text: $loyaltyNumber)
                }
            }
            Section("Add a tip?") {
                Picker("Percentage :",selection: $tipAmount) {
                    ForEach(tipAmounts,id:\.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total : $100") {
                Button("Confirm order") {
                    //TODO:
                }
            }
        }
        
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
