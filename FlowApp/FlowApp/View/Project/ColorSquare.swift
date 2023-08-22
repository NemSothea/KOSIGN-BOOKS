//
//  ColorQuare.swift
//  FlowApp
//
//  Created by Bizplay on 2023/08/07.
//

import SwiftUI

struct ColorSquare: View {
    var body: some View {
        Rectangle()
            .frame(width: 10, height: 10)
            .foregroundColor(generateRandomColor())
    }
    
    func generateRandomColor() -> Color {
        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink]
        return colors.randomElement() ?? .gray
    }
}
