//
//  WebKitType.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/25.
//

import Foundation
import WebKit

enum WebKitType {
    
    case General
    case Create_WebView
    case Cookie_WebView
    
}
enum ActionCode : String {
    
    case empty      = ""
    case ac_1004    = "1004" // (Session TimeOut)
    
}
extension WebKitViewController {
    // TODO: - Check Action code from web navigation action
    func checkActionCode(jsonData:String,completion: @escaping (String,[String:Any]?) -> Void) {
        
        if jsonData.lowercased().contains("iwebaction") {
            var actionDic: [String: Any]?
            
            let compJson = jsonData.components(separatedBy: ":")
            let scheme = compJson.first ?? ""
            let jsonString = jsonData.replacingOccurrences(of: "\(scheme):", with: "")
            actionDic = jsonString.removingPercentEncoding?.toDictionary
            
            if jsonData.lowercased().contains("iwebactionssotoken"){
                completion("token", actionDic!)
            }
            else {
                if let actionDic = actionDic {
                    guard let actionCodes = (actionDic["_action_code"] as? String)?.components(separatedBy: "|") else {
                        return
                    }
                    if let actionData = actionDic["_action_data"] as? [String:Any] {
                        for actionCode in actionCodes {
                            completion(actionCode,actionData)
                        }
                    }else if let actionData = actionDic["_action_data"] as? String {
                        for actionCode in actionCodes {
                            let dic = [
                                "RESP_CD" : actionData,
                                "RESP_NM" : actionData
                            ]
                            completion(actionCode, dic)
                        }
                    }
                    else {
                        for actionCode in actionCodes {
                            completion(actionCode,nil)
                        }
                    }
                }
            }
            
        }
    }
}
