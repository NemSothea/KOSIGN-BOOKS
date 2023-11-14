//
//  FlagGameHelper.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/11/23.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    
    private let name: String

    init(name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}
//#Preview {
//    GifImage(name: "animatedflagcambodia")
//}
