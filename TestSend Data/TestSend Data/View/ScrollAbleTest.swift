//
//  UserView.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/9/23.
//

import SwiftUI

struct ScrollAbleTest: View {
    
    @State private var currentIndex: Int = 0
    @State private var isAutoScrollEnabled = false
    
    private let itemCount = 5
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators : false) {
            ScrollViewReader { scrollView in
                HStack(spacing: 20) {
                    ForEach(0...itemCount, id: \.self) { index in
                        VStack {
                            Text("Item \(index + 1)")
                                .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            Button(action: {
                                //action here
                               
                                    scrollToNextIndex(scrollView: scrollView, currentIndex: index)
                                
                            }) {
                                Text("Next Index")
                                    .font(.title2)
                                    .foregroundColor(.red)
                            }
                        }
                        .id(index)
                    }
                }
                .padding()
            }
              
        }
        
     
        .scrollDisabled(true)
        
    }
  
    private func scrollToNextIndex(scrollView: ScrollViewProxy,currentIndex: Int) {
        withAnimation {
            if currentIndex == itemCount - 1 {
                self.currentIndex = 0 // If it's the last index, return to the first index
            } else {
                self.currentIndex += 1
            }
            let nextIndex = (currentIndex + 1) % itemCount
            scrollView.scrollTo(nextIndex, anchor: .center)
        }
    }
}

#Preview {
    ScrollAbleTest()
}
