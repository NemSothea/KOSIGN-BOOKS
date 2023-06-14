//
//  ObserableObject.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/05/31.
//

import Foundation
class ObservableObjects<T> {
    
    private var listener : ((T) -> Void)?
    
    var value : T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value : T) {
        self.value = value
    }
    
    func bind(_ listener : @escaping (T) -> Void) {
        
        listener(value)
        self.listener = listener
        
    }
    
}
