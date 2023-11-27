//
//  TestingView.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/26/23.
//

import SwiftUI

//struct TestingView: View {
//    var body: some View {
//        ForEach(0...10,id: \.self) { index in
//            HelloView(index: index)
//        
//        }
//    }
//}
//struct HelloView : View {
//    let index : Int
//    var body: some View {
//        HStack {
//           Text("Hello, World!\(index)")
//       }
//    }
//   
//}
struct TestingView: View {
    var body: some View {
        NavigationView {
            ForEach(0...10,id: \.self) { index in
                Text("Hello")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "sun.min.fill")
                        Text("Title").font(.headline)
                    }
                }
            }
        }
        
    }
}

#Preview {
    TestingView()
}
