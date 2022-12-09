//
//  String.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/12/09.
//

import Foundation
extension String {
    var toDictionary : [String : Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data,options: []) as? [String : Any]
            }catch {
                #if DEBUG
                print(error.localizedDescription)
                #endif
            }
        }
        return nil
    }
}
