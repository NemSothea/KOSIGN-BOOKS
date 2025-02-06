//
//  DefaultIntent.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/6/25.
//

import Foundation
import AppIntents
import SwiftUI

@available(iOS 16.0, *)

struct DefaultIntent: AppIntent {
    @available(iOS 16, *)
    
    static var title: LocalizedStringResource = "Get Started with TOPIK"
    
    @available(iOS 16, *)
    static var openAppInvocationPhrase: LocalizedStringResource = "Open my TOPIK"
    
    @available(iOS 16, *)
    static var openAppWhenRun: Bool = true //This property is for directly open the app when click on shortapp
    
    @available(iOS 16.0, *)
    @MainActor
    func perform() async throws -> some IntentResult {
        return .result()
    }
    
}
