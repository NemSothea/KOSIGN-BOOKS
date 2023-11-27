//
//  FlagGameHelper.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/11/23.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    
    private let name    : String
    private let isFlag  : Bool
    private let isTime  : Bool

    init(name : String, isFlag : Bool,isTime : Bool) {
        self.name   = name
        self.isFlag = isFlag
        self.isTime = isTime
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        if isTime {
            let url = Bundle.main.url(forResource: name, withExtension: "gif")!
            let data = try! Data(contentsOf: url)
            webView.load(
                data,
                mimeType: "image/gif",
                characterEncodingName: "UTF-8",
                baseURL: url.deletingLastPathComponent()
            )
        }else {
            // Load Flag GIF
            // Load Celebration GIFs
                let htmlContentCelebration = """
                       <html>
                           <head>
                               <style>
                                   body {
                                       display: flex;
                                       align-items: center;
                                       justify-content: center;
                                       height: 100vh;
                                       margin: 10;
                                       overflow: hidden;
                                   }
                                   img {
                                       width: 100%;
                                       height: 90%;
                                   }
                               </style>
                           </head>
                           <body>
                               <img src="\(name).gif" alt="gif">
                           </body>
                       </html>
                       """
            //Load Flag GIF
            let htmlContentFlag = """
                   <html>
                       <head>
                           <style>
                               body {
                                   display: flex;
                                   align-items: center;
                                   justify-content: center;
                                   height: 100vh;
                                   margin: 0;
                                   overflow: hidden;
                               }
                               img {
                                   width: 100%;
                                   height: 100%;
                               }
                           </style>
                       </head>
                       <body>
                           <img src="\(name).gif" alt="gif">
                       </body>
                   </html>
                   """
            
            webView.loadHTMLString(isFlag ? htmlContentFlag : htmlContentCelebration, baseURL: Bundle.main.bundleURL)
        }
    
        webView.scrollView.isScrollEnabled  = false
        webView.isOpaque                    = false
        webView.backgroundColor             = UIColor.clear
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}
#Preview {
    GifImage(name: "Time", isFlag: false, isTime: true)
}
