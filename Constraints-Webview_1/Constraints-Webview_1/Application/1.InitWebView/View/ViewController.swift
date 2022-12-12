//
//  ViewController.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/22.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var webKitView : WKWebView!
    
    var webKitType = CONTENT_TYPE.InitWebKitView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch webKitType {
        case .InitWebKitView:
            /*
             1/ LoadURL
             2/ WKNavigationDelegate
             3/ Cookies
             */
            self.InitWebKitView()
        case .LoadLocalHTML:
            self.loadHTMLFile()
        case .LoadLocalHTMLString:
            self.loadLocalHTMLString()
        case .LoadJavaScriptMethod:
            self.configureEvaluateJavaScript()
        case .InjectJavaScriptCode:
            self.configureUserScript()
        case .CallBackFromJavaScript:
            break
        default:break
        }
        
    }
/**
        TODO :- FUNCTION
 */
    /*
      TODO : loadHTMLFile
     */
    private func InitWebKitView() {
        let url = URL(string: "https://www.kosign.com.kh/")!
        webKitView.load(URLRequest(url: url))
        webKitView.allowsBackForwardNavigationGestures = true
    }
    /*
      TODO :- loadHTMLFile
     */
    private func loadHTMLFile() {
        guard let htmlPath = Bundle.main.path(forResource: "index", ofType: "html") else { return }
        let htmlUrl = URL(fileURLWithPath: htmlPath, isDirectory: false)
        webKitView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
    }
    /*
      TODO :- load Local HTMLString
     */
    private func loadLocalHTMLString() {
        webKitView.loadHTMLString("<h1 style=color:red> HELLO WORLD</h1>", baseURL: nil)
    }
  
}

