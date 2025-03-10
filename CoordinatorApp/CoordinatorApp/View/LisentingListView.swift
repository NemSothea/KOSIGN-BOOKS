//
//  LisentingListView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/10/25.
//
import SwiftUI

struct LisentingListView : View {
    
    //MARK: - Properties
    @StateObject var readingModel = QuestionViewModel()
    
    let fontSize = Share.shared.setFontSize()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader
            { geometry in
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(readingModel.TOPIKQuestionArray, id: \.titleListening) { item in
                            
                            NavigationLink {
                                ListeningQuestionView(indexTopic: item.rawValue)
                            } label : {
                                
                                VStack(alignment: .center) {
                                    Image(systemName: "ear.badge.waveform")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .foregroundStyle(Color(UIColor.random()))
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .padding()
                                    
                                    VStack {
                                        Text("\(item.titleListening)")
                                            .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                                            .fontWeight(.bold)
                                    }
                                    .padding()
                                }
                                .cornerRadius(8.0)
                                
                            }
                            
                        }
                    }
                }
            }
            
        }
        .navigationTitle("듣기")
    }
}
struct LisentingListView_Previews: PreviewProvider {
    static var previews: some View {
        LisentingListView(readingModel: .sample())
    }
}


