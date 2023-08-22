//
//  Projects.swift
//  FlowApp
//
//  Created by Bizplay on 2023/08/07.
//

import SwiftUI

struct Projects: View {
    // Sample data for the list
     @State var sampleData: [String] = (1...10).map { "Item \($0)" }
    // Sample favorites (indices of items with favorites icon)
       let favoriteIndices: Set<Int> = [1, 3, 5, 7, 9]
       
    var body: some View {
        NavigationView {
            List(0..<sampleData.count, id:\.self) { index in
                HStack {
                    ColorSquare()
                    Text(self.sampleData[index])
                    if favoriteIndices.contains(index) {
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Spacer()
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            .navigationBarItems(leading: Text("My Projects"), trailing: HStack {
                Image(systemName: "autostartstop")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                    .padding(.trailing, 16)
            })
        }
       
    }
}

struct Projects_Previews: PreviewProvider {
    static var previews: some View {
        Projects()
    }
}
