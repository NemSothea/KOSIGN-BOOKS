//
//  HelperVC.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/12/12.
//

import Foundation
import WebKit
extension ViewController : WKNavigationDelegate {
    /*
        TODO :- EvaluateJavaScript
     */
    func configureEvaluateJavaScript() {
        
        guard let htmlPath = Bundle.main.path(forResource: "index", ofType: "html") else { return }
        let htmlURL = URL(fileURLWithPath: htmlPath, isDirectory: false)
        self.webKitView.navigationDelegate = self
        self.webKitView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL)
        
    }
    /*
     TODO :- inject Javascript code into webpage (set color and text font size)
     */
    func configureUserScript() {
        guard let htmlPath = Bundle.main.path(forResource: "index", ofType: "html") else { return }
        let htmlUrl = URL(fileURLWithPath: htmlPath, isDirectory: false)
        //Inject Script
        let contentController = WKUserContentController()
        let userScript = WKUserScript(source: "readHeader()", injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(userScript)
        
        let configure = WKWebViewConfiguration()
        configure.userContentController = contentController
        
        let configureWebKitView = WKWebView(frame: self.webKitView.frame, configuration: configure)
        self.webKitView = configureWebKitView
        self.view = self.webKitView
        self.webKitView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        
    }
}
