//
//  ReadingWidgetEntryView.swift
//  TopikWidgetExtension
//
//  Created by NEMSOTHEA on 2/7/25.
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
struct ReadingWidgetEntryView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.widgetFamily) var family
    
    let urlString = "wegarden://orderList_widget?category=all".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    
    var entry: ReadingProvider.Entry
    
    var body: some View {
        switch family {
            
        case .systemSmall:
            VStack(alignment: .leading, spacing: 0) {
                ReadingView(items: entry.items)
            }
            .widgetBackground(Color.clear)
        case .systemMedium:
            VStack(alignment: .leading, spacing: 0) {
                ReadingView(items: entry.items)
            }
            .widgetBackground(Color.clear)
        case .systemLarge :
            VStack(alignment: .leading, spacing: 0) {
                ReadingView(items: entry.items)
            }
            .widgetBackground(Color.clear)
        case .systemExtraLarge :
            VStack(alignment: .leading, spacing: 0) {
                ReadingView(items: entry.items)
            }
            .widgetBackground(Color.clear)
        case .accessoryCircular :
            VStack {
                accessoryCircularView(urlString: urlString)
            }
            .widgetBackground(Color.clear)
        default:
            fatalError("Unsupported widget family")
        }
    }
}

@available(iOSApplicationExtension 16.0, *)
struct ReadingView : View {
    
    @Environment(\.colorScheme) private var colorScheme
//    var urlString : String
    var items: [(topikID : String,title:String)]
   
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            ForEach(items.prefix(5).indices,id:\.self) { index in
                let item = items[index]
                HStack {
                    Text(item.title)
                        .font(.caption2)
                
                    
                }
            }
            
        }
        

//        .widgetURL(URL(string: urlString))
        .applyForegroundStyle(colorScheme: colorScheme)
        
    }
}

struct accessoryCircularView : View {
    
    var urlString : String
    
    var body: some View {
        ZStack {
            Image(systemName: "books.vertical.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 35, height: 35)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Circle()
                .fill(Color.gray).opacity(0.3)
        )
        .widgetURL(URL(string: urlString))
        .widgetBackground(Color.clear)
    }
}



struct ReadingWidgetEntryViewPreviews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            if #available(iOSApplicationExtension 16.0, *) {
                ReadingWidgetEntryView(entry: .preview)
            } else {
                // Fallback on earlier versions
            }
        }
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
