//
//  ReadingEntry.swift
//  TopikWidgetExtension
//
//  Created by NEMSOTHEA on 2/7/25.
//

import SwiftUI
import WidgetKit

struct ReadingEntry: TimelineEntry {
    
    var date            : Date
    let configuration   : ReadingIntent
    var topikID         : String
    var items           : [(topikID : String,title:String)]
    
    static var preview : ReadingEntry {
        let entry = ReadingEntry(date: Date(),
                                 configuration: ReadingIntent(),
                                 topikID: "0",
                                 items: [])
        return entry
    }
}


