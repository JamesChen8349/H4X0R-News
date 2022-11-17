//
//  WebView.swift
//  H4X0R News
//
//  Created by JamesChen on 2022/11/15.
//

import Foundation
import WebKit //建立WebView需要import
import SwiftUI

//建立一個WebView實作UIViewRepresentable和方法makeUIView and updateUIView
//Error:Type 'WebView' does not conform to protocol 'UIViewRepresentable'
//要改為 WebView.UIViewType
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
