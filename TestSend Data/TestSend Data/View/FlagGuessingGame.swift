//
//  FlagGuessingGame.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/11/23.
//

import SwiftUI



struct FlagGuessingGame: View {
    
    @State private var flags = ["animatedflagcambodia"]
    
    @State private var countries = ["សហរដ្ឋ អាមេរិក", "កាណាដា", "កម្ពុជា"]
    
    @State private var currentCountry  = "animatedflagcambodia"
    @State private var playerGuess  = ""
    @State private var score        = 0
    
    // Declare the variable 'randomCountry' outside of the `HStack` block
    var randomCountry: String {
        get {
            return countries.randomElement() ?? ""
        }
    }
    
    var body: some View {
        
        VStack {
            
            
            VStack {
                Text("តើទង់ជាតិនេះជាកម្មសិទ្ធិរបស់ប្រទេសណា?")
                    .font(.title)
                
                GifImage(name: "animatedflagcambodia")
                    .padding()
            }
            
            
            Divider()
            
           CountdownView1()
            
            Divider()
                .padding()
            // Create 3 buttons with random name countries
            ScrollView {
                VStack {
                    ForEach(countries, id: \.self) { name in
                        Button(action: {
                            // TODO: Implement button action
                        }) {
                            Text("\(name)")
                                .font(.largeTitle)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .padding()
                        }.frame(width: UIScreen.main.bounds.width - 40,height: 70)
                            .background(Color.blue)
                        
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
                    }
                }
            }
        }
    }
}




#Preview {
    FlagGuessingGame()
}
