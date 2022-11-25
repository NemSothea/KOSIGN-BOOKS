//
//  WebKitViewController.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/24.
//

import UIKit
import WebKit

class WebKitViewController : UIViewController {

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
