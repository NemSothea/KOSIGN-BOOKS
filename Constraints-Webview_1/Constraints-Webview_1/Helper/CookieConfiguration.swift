//
//  CookieConfiguration.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/25.
//

import Foundation
import WebKit

extension WebKitViewController {
  /**
                TODO :- Set Cookie
   */
    func setWebKitCookie() {
        let cookies = HTTPCookie(properties: [
            .version: 0,
            .name : "JSESSIONID",
            .value:"approval-dev.appplay.co.kr",
            .expires : Date().addingTimeInterval(31536000)
        ])!
        
        //1. Set Cookie on HTTPCookie
        webKitView.configuration.websiteDataStore.httpCookieStore.setCookie(cookies)
        
        //2. Store cookie in HTTPCookieStore
        HTTPCookieStorage.shared.setCookie(cookies)
    }
}
