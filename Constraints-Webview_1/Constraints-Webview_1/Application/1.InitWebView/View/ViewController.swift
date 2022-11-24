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
            self.InitWebKitView()
        case .LoadURL:
            break
        case .WKNavigationDelegate:
            break
        case .Cookies:
            break
        case .LoadLocalHTML:
            break
        case .LoadLocalHTMLString:
            break
        case .LoadJavaScriptMethod:
            break
        case .InjectJavaScriptCode:
            break
        case .CallBackFromJavaScript:
            break
        }
        
    }
/**
        TODO :- FUNCTION
 */
    private func InitWebKitView() {
        let url = URL(string: "https://www.kosign.com.kh/")!
        webKitView.load(URLRequest(url: url))
        webKitView.allowsBackForwardNavigationGestures = true
    }

}

