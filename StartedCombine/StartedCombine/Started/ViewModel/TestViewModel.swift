//
//  TestViewModel.swift
//  StartedCombine
//
//  Created by Bizplay on 2023/07/20.
//

import Foundation
import Combine

final class TestViewModel {
    
    ///@Published usage to bind values to changes
    /// - Published : This keyword is a property wrapper and adds a Publisher to any property
    @Published var isSubmitAllowed : Bool = false
}
