//
//  ReadingWidgetViewModel.swift
//  TopikWidgetExtension
//
//  Created by NEMSOTHEA on 2/7/25.
//

import Foundation
import Combine

class ReadingWidgetViewModel : ObservableObject {
    
    @Published var readingData: [ReadingWidgetModel] = []
    
    init() {
        
        self.readingData = self.fetchData()
        
    }
    
    func fetchData() -> [ReadingWidgetModel] {
        
        let appGroup = UserDefaults.appGroupIdentifier
        
        var readingWidgetModelData = [ReadingWidgetModel]()
        
        if let readingData = appGroup?.data(forKey: "ReadingWidgetData") {
            do {
                let decoder = JSONDecoder()
                
                readingWidgetModelData = try decoder.decode([ReadingWidgetModel].self, from: readingData)
                
                print("readingWidgetModelData",readingWidgetModelData)
                
                return readingWidgetModelData
            }catch {
             
                fatalError("ReadingWidgetData was not able to decode")
            }
        }
        
        return readingWidgetModelData
        
    }
    
    
    
}
