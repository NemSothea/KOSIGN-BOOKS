//
//  CoordinatorShortcuts.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/6/25.
//

import Foundation
import AppIntents
struct OrderAppShortcuts: AppShortcutsProvider {
    
    @available(iOS 16, *)
    static var shortcutTileColor: ShortcutTileColor = .lime
    
    @available(iOS 16.0, *)
    static var appShortcuts: [AppShortcut] {
    
        AppShortcut(
            intent: DefaultIntent(),
            phrases: [
                    "Open my TOPIK in \(.applicationName)",
                    "Show my TOPIK in \(.applicationName)",
            ],
            shortTitle: "Open TOPIK",
            systemImageName: "book.pages"
        )
      
    }
    

    
   
}
