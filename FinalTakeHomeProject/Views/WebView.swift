//
//  WebView.swift
//  FinalTakeHomeProject
//
//  Created by Anand Otiv on 2025-04-16.
//


//View for visiting st clair website

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    let webText: String?
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let text = webText, let url = URL(string: text) else { return }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    typealias UIViewType = WKWebView
    
    
    
    
}

