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
                ReadingSystemSmallView(items: entry.items)
            }
            .widgetBackground(Color.clear)
     
        case .systemLarge :
            VStack(alignment: .leading, spacing: 0) {
                ReadingSystemLargeView(items: entry.items)
            }
            .widgetBackground(Color.clear)
        case .systemExtraLarge :
            VStack(alignment: .leading, spacing: 0) {
                ReadingSystemLargeView(items: entry.items)
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

#warning("Build for systemSmall size only")
@available(iOSApplicationExtension 16.0, *)

struct ReadingSystemSmallView : View {
    
    @Environment(\.colorScheme) private var colorScheme
//    var urlString : String
    var items: [(topikID : String,title:String)]
   
    
    var body: some View {
        
        HStack(spacing: 5){
            VStack(alignment: .leading, spacing: 0) {
                Section(content: {
                    ForEach(items.suffix(3).indices.reversed(),id: \.self) { index in
                        let item = items[index]
                            HStack {
                                Image(systemName: "smallcircle.filled.circle.fill")
                                    .font(.footnote)
                                    .foregroundStyle(Color.accentColor)
                                Text("\(item.title)")
                                    .font(.subheadline)
                                
                                Image(systemName: "book.closed.circle")
                                    .font(.caption)
                                    .foregroundStyle(Color(UIColor.random()))
                            }
                        Spacer(minLength: 5)
                            Divider()
                        }
                    
                }, header: {
                    Text("읽기 ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                     
                })
            }

        }
        .padding(.all,5)
      
     
        

//        .widgetURL(URL(string: urlString))
        .applyForegroundStyle(colorScheme: colorScheme)
        
    }
}

#warning("Build for Large size only")
@available(iOSApplicationExtension 16.0, *)

struct ReadingSystemLargeView : View {
    
    @Environment(\.colorScheme) private var colorScheme
//    var urlString : String
    var items: [(topikID : String,title:String)]
   
    
    var body: some View {
        
        HStack(spacing: 5){
            VStack(alignment: .leading, spacing: 0) {
                Section(content: {
                    ForEach(items.dropFirst(10).indices.reversed(),id: \.self) { index in
                        let item = items[index]
                            HStack {
                                Image(systemName: "smallcircle.filled.circle.fill")
                                    .font(.footnote)
                                    .foregroundStyle(Color.accentColor)
                                Text("\(item.title)")
                                    .font(.subheadline)
                                
                                Image(systemName: "book.closed.circle")
                                    .font(.caption)
                                    .foregroundStyle(Color(UIColor.random()))
                            }
                        Spacer(minLength: 5)
                            Divider()
                        }
                    
                }, header: {
                    Text("읽기 ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                     
                })
            }
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                

                Section(content: {
                 
                    ForEach(items.dropLast(10).indices,id: \.self) { index in
                        let item = items[index]
                        HStack {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .font(.footnote)
                                .foregroundStyle(Color.accentColor)
                            Text("\(item.title)")
                                .font(.subheadline)
                            
                            Image(systemName: "book.closed.circle")
                                .font(.caption)
                                .foregroundStyle(Color(UIColor.random()))
                        }
                        Spacer(minLength: 5)
                        Divider()
                        }
                    
                }, header: {
                    Text("")
                })
                
            }
        }
        .padding(.all,5)
      
     
        

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
        .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    }
}
