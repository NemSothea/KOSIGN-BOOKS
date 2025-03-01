//
//  HelperWidget.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/7/25.
//
import WidgetKit
import SwiftUI

//TODO: - WidgetConfiguration
extension WidgetConfiguration {
    func contentMarginsDisabledIfAvailable() -> some WidgetConfiguration
    {
        if #available(iOSApplicationExtension 17.0, *)
        {
            return self.contentMarginsDisabled()
        }
        else
        {
            return self
        }
    }
}

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
    @ViewBuilder
    func applyForegroundStyle(colorScheme: ColorScheme) -> some View {
        if #available(iOS 15.0, *) {
            self.foregroundStyle(colorScheme == .dark ? .white : .black)
        } else {
            self.foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
    
}
