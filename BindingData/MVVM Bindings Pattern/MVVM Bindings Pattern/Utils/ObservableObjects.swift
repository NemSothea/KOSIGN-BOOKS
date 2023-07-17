//
//  ObserableObject.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/05/31.
//

import Foundation
class ObservableObjects<T> {
    
    // A closure that will be called whenever the value changes
    private var listener : ((T) -> Void)?
    
    // The stored value of the observable object
    var value : T {
        didSet {
            // Notify the listener that the value has changed
            listener?(value)
        }
    }
    
    // Initialize the observable object with an initial value
    init(_ value : T) {
        self.value = value
    }
    // Bind a listener closure to the observable object
    func bind(_ listener : @escaping (T) -> Void) {
        
        // Call the listener with the current value to ensure it receives the initial value
        listener(value)
        
        // Set the listener to the provided closure
        self.listener = listener
        
    }
    
}
