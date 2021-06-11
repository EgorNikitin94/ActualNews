//
//  WebView.swift
//  ActualNews
//
//  Created by Егор Никитин on 11.06.2021.
//

import SwiftUI
import WebKit

enum WebViewNavigationAction {
    case backward, forward, reload
}

enum URLType {
    case local, `public`
}

struct WebView: UIViewRepresentable {
    
    var type: URLType
    var url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let urlValue = url  {
            webView.load(URLRequest(url: urlValue))
        }
    }
}
