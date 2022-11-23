//
//  CONTENTVM.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/23.
//

import Foundation

class ContentVM {
    
    var recordContent : [CONTENT]?
    
    func loadContent() {
        recordContent = [
            
            CONTENT(title: "1.Init WebView", type: CONTENT_TYPE.InitWebView),
            CONTENT(title: "2.LoadURL", type: CONTENT_TYPE.LoadURL),
            CONTENT(title: "3.WKNavigationDelegate", type: CONTENT_TYPE.WKNavigationDelegate),
            CONTENT(title: "4.Cookie", type: CONTENT_TYPE.Cookies),
            CONTENT(title: "5.Load local HTML", type: CONTENT_TYPE.LoadLocalHTML),
            CONTENT(title: "- Load local HTMLString", type: CONTENT_TYPE.LoadLocalHTMLString),
            CONTENT(title: "6.Load JavaScript Method", type: CONTENT_TYPE.LoadJavaScriptMethod),
            CONTENT(title: "- Inject JavaScript code into WebPage", type: CONTENT_TYPE.InjectJavaScriptCode),
            CONTENT(title: "- Call back from JavaScript to Swift(WKScriptMessageHandler)", type: CONTENT_TYPE.CallBackFromJavaScript),
        
        ]
    }
}
