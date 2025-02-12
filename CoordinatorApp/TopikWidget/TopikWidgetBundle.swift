//
//  TopikWidgetBundle.swift
//  TopikWidget
//
//  Created by NEMSOTHEA on 3/3/24.
//

import WidgetKit
import SwiftUI

@main
struct TopikWidgetBundle: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        ReadingWidget()
    }
    
}
