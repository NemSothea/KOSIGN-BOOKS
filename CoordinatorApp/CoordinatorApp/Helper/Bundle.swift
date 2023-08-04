//
//  Bundle.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/15.
//

import UIKit

extension Bundle {
    func decode<T : Decodable>(_ type : T.Type, from file : String) -> T? {
        
        guard let jSonFile = self.url(forResource: file, withExtension: nil) else {
            print("Failed to locate \(file) in app bundle.")
            return nil
        }
        do {
            
            let jSonData = try Data(contentsOf: jSonFile)
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: jSonData)
            return result
            
        }catch {
            print("Failed to load and decode JSON\(error)")
            return nil
        }
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}