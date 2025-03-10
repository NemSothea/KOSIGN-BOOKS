//
//  SetingView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/10/25.
//

import SwiftUI
import TipKit

enum AppearanceMode: String, CaseIterable {
    case light
    case dark
    case automatic
}

struct SettingTip : Tip {
    
 
    var title: Text {
        Text("Set your appearance mode")
    }
    
    var message: Text? {
        Text("Tap on the picker to change the appearance mode")
    }
    var image: Image? {
        Image(systemName: "timelapse")
    }
  
    
    
}
struct SetingView: View {
    
    //MARK: - Properties
    @AppStorage("appearanceMode") private var appearanceMode: AppearanceMode = .automatic
    
    var items = QuestionViewModel.sample().TOPIKQuestionArray
    
    let fontSize = Share.shared.setFontSize()
    
    let settingTip = SettingTip()
    
    var body: some View {
        VStack {
            Picker("Appearance Mode", selection: $appearanceMode) {
                ForEach(AppearanceMode.allCases, id: \.self) { mode in
                    Text(mode.rawValue.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                TipView(settingTip)
                    .tipBackground(.teal.opacity(0.2))
                
                ForEach(items,id: \.titleReading) { item in
                    HStack {
                        Text("\(item.titleReading)")
                            .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                            .fontWeight(.bold)
                        Spacer()
                        
                        Image(systemName: "book.pages")
                            .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                            .fontWeight(.medium)
                            .foregroundStyle(Color(UIColor.random()))
                    }
                    .padding()
                    .frame( height: 60)
                }
            }
            .padding()
            Spacer()
            
        }
        .task {
            try? Tips.resetDatastore()
            try?  Tips.configure([
                
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
        .preferredColorScheme(appearanceMode == .automatic ? nil : (appearanceMode == .dark ? .dark : .light))
        .navigationTitle("Appearance")
        
    }
}
#Preview {
    SetingView()
}
