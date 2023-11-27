//
//  CountdownView.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/11/23.
//

import SwiftUI

struct CountdownView: View {
    
    @State private var secondsRemaining = 30 // Initial countdown time
    
    var body: some View {
        HStack {
            
            HStack(alignment:.center) {
                GifImage(name: "Time", isFlag: false, isTime: true)
                    .frame(width: 50,height: 50)
                Text("\(secondsRemaining) seconds")
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .onAppear() {
                        // Start the countdown when the view appears
                        startCountdown()
                    }
            }
            Spacer()
            Button {
                
            }label: {
                Text("Let's drink")
                    .font(.title3)
                    .fontWeight(.bold)
                    .font(.system(size: 10))
                    .foregroundColor(.white)
                    
                    .padding()
            }
            .frame(height: 50)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding()
    }
    func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                // Stop the timer when the countdown reaches 0
                timer.invalidate()
                
            }
        }
    }
}

#Preview {
    CountdownView()
}
