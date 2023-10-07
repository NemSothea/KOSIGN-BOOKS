//
//  HeaderIView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        //Header
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .rotationEffect(Angle(degrees: 15))
            VStack {
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text("Get things done")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top,30)
        }
        //UIScreen.main.bounds.width * 3 : For rotationEffect(Angle(degrees: 15))
        .frame(
            width: UIScreen.main.bounds.width * 3,
               height: 300
        )
        .offset(y:-100)
    }
}

#Preview {
    HeaderView()
}
