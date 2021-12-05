//
//  ContentView.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 11/11/2021.
//

import SwiftUI
import CoreData
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = UIWebView

    let webView: UIWebView
    
    func makeUIView(context: Context) -> UIWebView {
        return webView
    }
    
    func updateUIView(_ uiView: UIWebView, context: Context) { }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView: View {
    
    @StateObject var model = WebViewModel()
    
    var body: some View {
        WebView(webView: model.webView)
    }
}
