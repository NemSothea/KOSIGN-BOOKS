//
//  ReadingListView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/7/25.
//

import SwiftUI
import TipKit

class NavigationState: ObservableObject {
    @Published var isActive = false // Controls root navigation
}

struct AddTip: Tip {
    
    
    var title: Text {
        Text("Made by : ")
    }
    
    var message: Text? {
        Text("NEMSOTHEA")
    }
    
    var image: Image? {
        Image(systemName: "heart")
    }
}



struct ReadingListView: View {
    
    //MARK: - Properties
    @StateObject var readingModel = QuestionViewModel()
    
    @EnvironmentObject private var navState: NavigationState
    
    let fontSize = Share.shared.setFontSize()
    
    let addTipe = AddTip()
    
    var body: some View {
       
            GeometryReader
            { geometry in
                
                List {
                  
                    Section {
                        TipView(addTipe)
                            .tipBackground(.teal.opacity(0.2))
                        
                        ForEach(readingModel.TOPIKQuestionArray, id: \.titleReading) { item in
                            NavigationLink(
                                        destination:  ReadingQuestionView(indexTopic: item.rawValue),
                                        isActive: $navState.isActive,
                                        label: {
                                            HStack {
                                                Image(systemName: "book.pages")
                                                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                                                    .fontWeight(.medium)
                                                    .foregroundStyle(Color(UIColor.random()))
                                                    .padding(.trailing)
                                                Text("\(item.titleReading)")
                                                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                                                    .fontWeight(.bold)
                                                
                                            }
                                            .frame( height: 50)
                                            
                                        }
                                    )
                            
//                            NavigationLink {
//                                ReadingQuestionView(indexTopic: item.rawValue)
//                            } isActive: $navState.isActive {
//                                
//                            }
//                            label : {
//                                HStack {
//                                    Image(systemName: "book.pages")
//                                        .font(.custom("1HoonDdukbokki Regular", size: fontSize))
//                                        .fontWeight(.medium)
//                                        .foregroundStyle(Color(UIColor.random()))
//                                        .padding(.trailing)
//                                    Text("\(item.titleReading)")
//                                        .font(.custom("1HoonDdukbokki Regular", size: fontSize))
//                                        .fontWeight(.bold)
//                                    
//                                }
//                                .frame( height: 50)
//                            }
//                            .buttonStyle(.plain)
                            
                            
                        }
                    } footer: {
                        HStack {
                            
                        }
                        
                        
                    }
                    
                    
                }
                
            }
            
        .task {
            try? Tips.resetDatastore()
            try?  Tips.configure([
                
                .displayFrequency(.daily),
                .datastoreLocation(.applicationDefault)
            ])
        }
    }
    
}

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView(readingModel: .sample())
    }
}
