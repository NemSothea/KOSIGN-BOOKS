//
//  CONTENT.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/23.
//

import Foundation
struct CONTENT {
    
    var title : String?
    var type  : CONTENT_TYPE
    
}

enum CONTENT_TYPE  {
    
    case InitWebKitView
    case LoadURL
    case WKNavigationDelegate
    case Cookies
    case LoadLocalHTML
    case LoadLocalHTMLString
    case LoadJavaScriptMethod
    case InjectJavaScriptCode
    case CallBackFromJavaScript
    
}



