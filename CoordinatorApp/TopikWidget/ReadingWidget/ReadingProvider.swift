//
//  ReadingProvide.swift
//  TopikWidgetExtension
//
//  Created by NEMSOTHEA on 2/7/25.
//

import SwiftUI
import WidgetKit

struct ReadingProvider: IntentTimelineProvider {
    
    typealias Entry     = ReadingEntry
    typealias Intent    = ReadingIntent
    
    func placeholder(in context: Context) -> ReadingEntry {
        ReadingEntry.preview
    }
    
    func getSnapshot(for configuration: ReadingIntent, in context: Context, completion: @escaping (ReadingEntry) -> Void) {
        
        let readingVM = ReadingWidgetViewModel()
        
        guard let readingData = readingVM.readingData.first else {
            fatalError("No default reading found")
         
        }
        let readingConfiguration = configuration.parameter
        
        if context.isPreview { // return data value
            if readingVM.readingData.contains(where: {"\($0.topikID ?? 0)" == readingConfiguration?.identifier}) {
                let entry = ReadingEntry(
                    date: Date(),
                     configuration: configuration,
                    topikID: "\(readingData.topikID ?? 0)",
                    items: readingVM.readingData.map {("\($0.topikID ?? 0)", $0.topikName ?? "")
                })
                
                completion(entry)
            }
        }else { // return default value of data
            let entry = ReadingEntry(date: Date(), configuration: configuration,topikID: "0", items: readingVM.readingData.map { ("\($0.topikID ?? 0)", $0.topikName ?? "")})
            
            completion(entry)
        }
        
        
    }
    
    
    func getTimeline(for configuration: ReadingIntent, in context: Context, completion: @escaping (Timeline<ReadingEntry>) -> Void) {
        
        
        var entries         : [ReadingEntry] = []
        let readingVM       : ReadingWidgetViewModel = ReadingWidgetViewModel()
        
        let readingConfiguration    = configuration.parameter
        let readingData             = readingVM.readingData.first
      
        
        if context.isPreview {
        
            let timeline = Timeline(entries: [ReadingEntry.preview], policy: .atEnd)
            return completion(timeline)
        }
        
        if readingVM.readingData.contains(where: {"\($0.topikID ?? 0)" == readingConfiguration?.identifier}) {
            
            let entry = ReadingEntry(date: Date(), configuration: configuration,topikID: readingConfiguration?.identifier ?? "",items: readingVM.readingData.map { ("\($0.topikID ?? 0)", $0.topikName ?? "") })
            
            entries = [entry]
            
            let timeline = Timeline(entries: entries, policy: .atEnd)
            return completion(timeline)
            
        }else {
            if let readingData = readingData {
                let entry = ReadingEntry(date: Date(), configuration: configuration,topikID: "\(readingData.topikID ?? 0)" ,items: readingVM.readingData.map { ("\($0.topikID ?? 0)", $0.topikName ?? "")})
                entries = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                return completion(timeline)
                
            }else {
                
                let entry = ReadingEntry(date: Date(), configuration: configuration, topikID: "24",items: readingVM.readingData.map { ("\($0.topikID ?? 0)", $0.topikName ?? "")})
                entries = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                return completion(timeline)
            }
           
            
            
          
            
        }
        
        
        
    }
    
    
   
}

