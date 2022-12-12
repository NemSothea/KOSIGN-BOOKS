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
    func scriptMessage() {
        guard let htmlPath = Bundle.main.path(forResource: "testJavaScript", ofType: "html") else { return }
        let htmlUrl = URL(fileURLWithPath: htmlPath, isDirectory: false)
        
        let userContentController = WKUserContentController()
        /*
         - self : for Delegate WKScriptMessageHandler
         - name : for the key you want the app to listen to
         */
        userContentController.add(self, name: "observer")
        let configure = WKWebViewConfiguration()
        configure.userContentController = userContentController
        let configureWebKitView = WKWebView(frame: self.webKitView.frame, configuration: configure)
        self.webKitView = configureWebKitView
        self.view = self.webKitView!
        webKitView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        
    }
    private func showUserInfo(name : String?, email : String?) {
        var messageDecription = "User name : \(name ?? "") have email address : \(email ?? "")"
        var titleAlert = "User Information"
        
        if name == "" || email == "" {
            titleAlert = "Notice"
            messageDecription = "Please input name or email adress to show data"
        }
        let alertViewController = UIAlertController(title: titleAlert, message: messageDecription, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default) {
            _ in
            if name != "" && email != "" {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alertViewController.addAction(okAlert)
        self.present(alertViewController, animated: true)
    }
    
}
// MARK :- WKScriptMessageHandler
extension ViewController : WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "observer", let messageBody = message.body as? [String : String] {
            let userName = messageBody["name"],userEmail = messageBody["email"]
            self.showUserInfo(name: userName, email: userEmail)
        }
    }
    
    
}
