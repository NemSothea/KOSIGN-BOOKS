//
///  FlagGuessingGame.swift
///  TestSend Data
///
///  Created by NEMSOTHEA on 11/11/23.
/// *Game flow
///  1.

import SwiftUI
import PopupView

struct FlagGuessingGame: View {
    
    @State private var countries: [CountryModel] = []
    
    @State private var secondsRemaining = 120 // Initial countdown time
    
    @State private var correctCountry   = ""
   
    @State var showingPopup             = false
    
    private let widthTemp               = UIScreen.main.bounds.width
    
    var body: some View {
        
        NavigationStack {
            
            Text("what is the flag country?")
                .font(.title)
            
            ScrollView(.horizontal) {
                
                ScrollViewReader { scrollView in
                    HStack(alignment :.center ,spacing: 20 ) {
                        ForEach(countries) { country in
                            
                         
                            
                            VStack {
                                VStack {
                                    GifImage(name: "\(country.countryName)", isFlag: true, isTime: false)
                                }
                                .frame(width: widthTemp,height: 200)
//                                .background(Color.red)
                                
                                //Count Down code here
                                HStack {
                                    HStack(alignment:.center) {
                                        GifImage(name: "Time", isFlag: false,isTime: true)
                                            .frame(width: 50,height: 50)
                                            
                                        Text("\(secondsRemaining) seconds")
                                            .fontWeight(.bold)
                                            .foregroundColor(.orange)
                                    }
//                                    .background(Color.red)
                                    Spacer()
                                    
                                    HStack {
                                        Text("\(country.id)/\(countries.count)")
                                            .font(.subheadline)
                                            .foregroundStyle(.white)
                                            .padding()
                                            .background(.green)
                                            .clipShape(Circle())
                                    }
                                    
                                    Button {
                                        self.showPopup()
                                    } label: {
                                        Text("Let's drink")
                                            .font(.title3)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.white)
                                            .padding(5)
                                          
                                    }
                               
                                    .frame(height: 50)
                                    .background(Color.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(5)
                                    
                                }
                                .frame(width: widthTemp-30)
                                
                              // Question
                                VStack {
                                   
                                    Button {
                                        self.checkAnswer(selectedCountry: country.countryNameOne,correctCountry: country.correctCountry)
                                    } label: {
                                        Text("\(country.countryNameOne)")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .frame(width: widthTemp-60)
                                    }
                                    
                                    .buttonStyle(.borderedProminent)
                                    .tint(.pink)
                                    
                                    Button {
                                        self.checkAnswer(selectedCountry: country.countryNameTwo,correctCountry: country.correctCountry)
                                    } label: {
                                        Text("\(country.countryNameTwo)")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .frame(width: widthTemp-60)
                                    }
                                   
                                    .buttonStyle(.borderedProminent)
                                    .tint(.pink)
                                    
                                    Button {
                                        self.checkAnswer(selectedCountry: country.countryNameThree,correctCountry: country.correctCountry)
                                    } label: {
                                        Text("\(country.countryNameThree)")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .frame(width: widthTemp-60)
                                    }

                                    .buttonStyle(.borderedProminent)
                                    .tint(.pink)
                                    
                                    
                                }
                                
//                                .background(Color.cyan)
                               
                                
                                
                            }
//                            .frame(width: widthTemp)
//                            .background(Color.red)
                            .id(country.id)
                        }
                    }
                }
            }
            .scrollDisabled(true)
            // get Load  JSON on first
            .onAppear() {
                // Load your JSON data into the 'countries' array
                self.countries = getCountriesFromJSON()
                self.startCountdown()
                
                
            }
            
            .navigationBarTitleDisplayMode(.inline)
                 .toolbar {
                     ToolbarItem(placement: .principal) {
                         HStack {
                             Image(systemName: "lasso.badge.sparkles")
                             Text("Flag Game").font(.headline)
                         }
                     }
                 }
        }
       
        
       
        .popup(isPresented: $showingPopup) {
            GifImage(name: "contrate_giphy", isFlag: false, isTime: false)
            
            VStack {
                
                Button(action: {
                    // Dismiss button is tapped
                    self.dismissPopup()
                }) {
                    Text("Dismiss")
                        .frame(width: widthTemp - 40, height: 50)
                        .background(Color.brown)
                        .cornerRadius(30.0)
                }
                .offset(y: (UIScreen.main.bounds.height/2) - 50)
                
            }
        
            .padding()
            
            
        } customize: {
            $0
                .type(.floater())
                .position(.bottom)
                .animation(.easeInOut)
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.8))
        }
    }
    
    func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                // Stop the timer when the countdown reaches 0
                
                timer.invalidate()
                
                self.showPopup()
            }
        }
    }
    
    func checkAnswer(selectedCountry: String, correctCountry: String) {
        self.correctCountry = correctCountry
        if self.correctCountry.uppercased() == selectedCountry.uppercased() {
            self.showingPopup = true
        }else {
            /// Show message
            /// You can go to next question
        }
    }
    func showPopup() {
      
        self.showingPopup = true
    }
    func dismissPopup() {
        // Reset necessary variables and load a new question
        self.showingPopup = false
   
        
    }
    func getCountriesFromJSON() -> [CountryModel] {
       
        // Load your JSON data into the 'countries' array
        if let path = Bundle.main.path(forResource: "FlagDataBase", ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            do {
                let decodedCountries = try JSONDecoder().decode([CountryModel].self, from: data)
//                correctCountry = decodedCountries.filter {$0.correctCountry == }
                return decodedCountries
                
            }catch {
                print("Error decoding JSON:", error)
            }
        }else {
            print("Failed to load or decode JSON data.")
        }
        
        return [] // Return an empty array in case of failure
    }
}


#Preview {
    FlagGuessingGame()
}
