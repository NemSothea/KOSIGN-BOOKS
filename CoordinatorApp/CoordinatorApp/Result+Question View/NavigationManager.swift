//
//  NavigationManager.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/20/25.
//
import SwiftUI

class NavigationManager: ObservableObject {
    enum Route: Hashable {
        case ReadingQuestionView, ResultView
    }

    @Published var path = NavigationPath()
}
