//
//  HeaderIView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct HeaderView: View {
    
    //MARK: - Properties
    var title       : String
    var subtitle    : String
    var degree      : Double
    var background  : Color
    
    var body: some View {
        //Header
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: degree))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subtitle)
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
//
//#Preview {
//    HeaderView(title: "To Do List", subtitle: "Get things done", degree: 15, background: .pink)
//}
