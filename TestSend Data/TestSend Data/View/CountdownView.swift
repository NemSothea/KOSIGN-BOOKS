//
//  CountdownView.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/11/23.
//

import SwiftUI

struct CountdownView: View {
    
    @State private var timeRemaining = 3000 // 50 minutes in seconds
    @State private var timer: Timer? = nil
    
    var body: some View {
        HStack {
            
            HStack(alignment:.center) {
                GifImage(name: "Time")
                    .frame(width: 50,height: 50)
                Text("\(timeRemaining.formatted()) វិនាទី")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                
            }
            
            Spacer()
            
            Button {
                
            }label: {
                Text("តោះ ផឹក")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(height: 50)
            .background(Color.red)
            
            .onAppear {
                if timeRemaining > 0 {
                    DispatchQueue.main.async {
                        startTimer()
                    }
                }
            }
        }
        .padding()
    }
    func startTimer() {
      timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
        timeRemaining -= 1

        if timeRemaining == 0 {
          stopTimer()
        }
      }
    }

     func stopTimer() {
         timer?.invalidate()
     }
}

struct CountdownView1: View {
  @State private var timeRemaining = 3000 // 50 minutes in seconds
  @State private var timer = Timer()

  var body: some View {
    VStack {
      Text("Time remaining: \(timeRemaining.formatted())")
        .font(.largeTitle)

      Button(action: {
        startTimer()
      }) {
        Text("Start timer")
          .font(.title)
          .hidden()
      }

      Button(action: {
        stopTimer()
      }) {
        Text("Stop timer")
          .font(.title)
      }
    }
    .onAppear {
      if timeRemaining > 0 {
        DispatchQueue.main.async {
          startTimer()
        }
      }
    }
  }

    func startTimer() {
      if timer == nil {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
          timeRemaining -= 1

          if timeRemaining == 0 {
            stopTimer()
          }
        }
      }
    }

  func stopTimer() {
    timer.invalidate()
  }
}

//
//#Preview {
//    CountdownView()
//}
