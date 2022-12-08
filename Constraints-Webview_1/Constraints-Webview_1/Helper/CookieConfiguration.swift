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
            .value : "E091155CA5E96C30FBE36AF7FC92522A",
            .name : "JSESSIONID",
            .domain:"approval-dev.appplay.co.kr",
            .path : "/",
            .expires : Date().addingTimeInterval(31536000)
        ])!
        
        //1. Set Cookie on HTTPCookie
        webKitView.configuration.websiteDataStore.httpCookieStore.setCookie(cookies)
        
        //2. Store cookie in HTTPCookieStore
        HTTPCookieStorage.shared.setCookie(cookies)
    }
    func getCookieFromWebsiteDataStore() {
        webKitView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            let cookieDict = HTTPCookie.requestHeaderFields(with: cookies)
            if let cookieStr = cookieDict["Cookie"] {
                print("Cookies ::: \(cookieStr)")
            }
        }
    }
    func getCookiesFromSpecificURL(url : URL) {
        if let cookie = HTTPCookieStorage.shared.cookies(for: url) {
            let cookieDict = HTTPCookie.requestHeaderFields(with: cookie)
            if let cookieStr = cookieDict["Cookie"] {
                print("Cookie :: :: \(cookieStr)")
            }
        }
    }
}
