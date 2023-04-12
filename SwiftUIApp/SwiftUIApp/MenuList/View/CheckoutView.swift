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
    
    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
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
