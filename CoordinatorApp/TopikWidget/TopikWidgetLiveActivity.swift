//
//  TopikWidgetLiveActivity.swift
//  TopikWidget
//
//  Created by NEMSOTHEA on 3/3/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TopikWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TopikWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TopikWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension TopikWidgetAttributes {
    fileprivate static var preview: TopikWidgetAttributes {
        TopikWidgetAttributes(name: "World")
    }
}

extension TopikWidgetAttributes.ContentState {
    fileprivate static var smiley: TopikWidgetAttributes.ContentState {
        TopikWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TopikWidgetAttributes.ContentState {
         TopikWidgetAttributes.ContentState(emoji: "🤩")
     }
}

//#Preview("Notification", as: .content, using: TopikWidgetAttributes.preview) {
//   TopikWidgetLiveActivity()
//} contentStates: {
//    TopikWidgetAttributes.ContentState.smiley
//    TopikWidgetAttributes.ContentState.starEyes
//}
