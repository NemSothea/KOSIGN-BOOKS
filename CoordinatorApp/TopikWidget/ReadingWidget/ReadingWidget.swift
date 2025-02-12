//
//  QuickBuyWidget.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/7/25.
//
import SwiftUI
import WidgetKit
import Intents

struct ReadingWidget: Widget {
    
    let kind: String = WidgetType.reading.rawValue
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ReadingIntent.self, provider: ReadingProvider()) { entry in
            ReadingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Reading TOPIK II")
        .description("Easily place tests and get more scores from TOPIK.")
        .contentMarginsDisabledIfAvailable()
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge,.accessoryCircular])
    }
    
}
