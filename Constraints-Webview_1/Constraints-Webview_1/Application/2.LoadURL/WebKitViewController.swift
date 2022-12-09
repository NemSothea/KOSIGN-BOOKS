//
//  WebKitViewController.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/24.
//

import UIKit
import WebKit

class WebKitViewController : UIViewController{

    @IBOutlet weak var webKitView : WKWebView!
    
    var webKitType      = WebKitType.General
    var urlString       : String!
    var param           : String?
    var urlRequest      : URLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupBaseWebKitView()
    }
    private func setupBaseWebKitView() {
        switch webKitType {
        case .Cookie_WebView:
            self.setWebKitCookie()
        default : break
        }
        self.webKitView.navigationDelegate = self
        self.loadURL()
    }
    private func loadURL() {
        let url = URL(string: urlString)
        guard let urlLoad = url else { return }
        
        urlRequest = URLRequest(url: urlLoad)
        
        if let myParam = self.param {
            urlRequest?.httpMethod  = "POST"
            urlRequest?.httpBody    = myParam.data(using: .utf8)
        }
//        getCookieFromWebsiteDataStore()
//        getCookiesFromSpecificURL(url: urlLoad)
        self.AddHeader()
        
        _ = webKitView.load(urlRequest!)
    }
    //TODO :- Setup Header
    private func AddHeader() {
        if let url = urlRequest?.url, let cookies = HTTPCookieStorage.shared.cookies(for: url) {
            let cookiesDict = HTTPCookie.requestHeaderFields(with: cookies)
            if let cookiesStr = cookiesDict["Cookie"] {
                urlRequest?.addValue(cookiesStr, forHTTPHeaderField: "Cookie")
            }
            
        }
        //-Add UserAgent
        let getUserAgent = "Mozilla/5.0 (iPhone; U; CPU iPhone OS \(UIDevice.current.systemVersion) like Mac OS X; ko-kr) AppleWebKit/605.1.15 (KHTML, like Gecko)"
        urlRequest?.addValue(getUserAgent, forHTTPHeaderField: "User-Agent")
        
        //Content type for supporting HTML request
        urlRequest?.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
      
    }
    func handleAction(webView : WKWebView, actionCode : String, actionData : [String: Any]?) {
        let actionCD = ActionCode(rawValue: actionCode) ?? .empty
        self.processActionCode(actionCode: actionCD, actionData: actionData)
    }
    func processActionCode(actionCode : ActionCode, actionData : [String : Any]?) {
        switch actionCode {
        case .empty : break
        case .ac_1004 : self.sessionTimeOutError()
        }
    }
    func sessionTimeOutError() {
        
        let alert = UIAlertController(title: "", message: "Session Timeout", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
        
    }
    func isItunesURL(_ urlString : String) -> Bool {
        return isMatch(urlString, "\\/\\/itunes\\.apple\\.com\\/")  || isMatch(urlString, "\\/\\/apps\\.apple\\.com\\/")
    }
    func isMatch(_ urlString : String, _ pattern : String) -> Bool {
        
        let regex = try! NSRegularExpression(pattern: pattern,options: [])
        let result = regex.matches(in: urlString,options: [], range: NSRange(location: 0, length: urlString.count))
        
        return result.count > 0
    }
    func canExecuteApplication(_ urlScheme : URL) -> Bool {
        return UIApplication.shared.canOpenURL(urlScheme)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
