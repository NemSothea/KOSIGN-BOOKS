//
//  TLButton.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/08.
//

import SwiftUI

struct TLButton: View {
    
    //MARK: - Properties
    let title   : String
    let color   : Color
    let action  :() -> Void
    
    var body: some View {
        Button {
            //login click action
            action()
            
        } label: {
            //Button style
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
           
        }
    }
}

//#Preview {
//    TLButton(title: "Value", color: .pink) {
//        //action
//    }
//}
