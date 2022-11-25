//
//  Encodable.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/24.
//

import Foundation
extension Encodable {
    var encodeToJsonString : String {
        
        let jsonEcoder  = JSONEncoder()
        let jsonData    = try? jsonEcoder.encode(self)
        let jsonString  = String(data: jsonData ?? Data(), encoding: .utf8) ?? ""
        return jsonString.addingPercentEncoding(withAllowedCharacters: .symbols) ?? ""
        
    }
}
