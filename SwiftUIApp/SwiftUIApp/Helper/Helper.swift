//
//  Helper.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/26.
//

import UIKit

extension Bundle {
    
    func decode<T : Decodable>(_ type : T.Type, from file : String) -> T? {
        
        guard let jSon = self.url(forResource: file, withExtension: nil) else {
            print("Failed to locate \(file) in app bundle.")
            return nil
        }
        print("JSON | : \(jSon)")
        do {
         
            let jSonData = try Data(contentsOf: jSon)
        
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: jSonData)
            return result
            
        }catch {
            print("Failed to load and decode JSON\(error)")
            return nil
        }
    }
    
}