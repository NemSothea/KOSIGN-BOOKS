//
//  Helper.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/21.
//

import UniformTypeIdentifiers

extension UTType {
    static let TodoList = UTType(exportedAs: "com.test.FlowApp")
}



/** -Published:
 Sure! In SwiftUI, the @Published property wrapper is used in conjunction with ObservableObject to create a reactive and observable data property. When you mark a property with @Published, it enables SwiftUI to automatically detect changes to that property and update the corresponding views whenever the property changes.

 Here's a detailed explanation of @Published:

 1. @Published is a property wrapper provided by SwiftUI that helps in managing reactive data within an ObservableObject.
 2. When you mark a property with @Published, it becomes an "observable" property, which means that SwiftUI monitors changes to this property.
 3. If the value of a property marked with @Published changes, SwiftUI will automatically notify any interested views and trigger a re-computation of the body.
 4. This allows for a reactive user interface, where changes to data trigger automatic updates in the UI without the need for manual view updates.
 5. Usually, you use @Published with properties declared in an ObservableObject class, allowing you to create reactive data models that can be observed by SwiftUI views.
 6. When the @Published property changes, SwiftUI uses the Combine framework internally to publish a change notification event to the views subscribed to the property.
 7. This enables SwiftUI to efficiently update only the parts of the UI affected by the changed data, resulting in better performance and responsiveness.

 class UserData: ObservableObject {
     // The property marked with @Published will trigger updates to the UI when changed
     @Published var favoriteColor: Color = .blue
 }

 */
