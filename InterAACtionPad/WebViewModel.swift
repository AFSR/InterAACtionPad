//
//  WebViewModel.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 11/11/2021.
//

import Foundation
import WebKit
import GCDWebServer

class WebViewModel: ObservableObject {
    let webView: UIWebView
    let url: URL
    
    var webServer:GCDWebServer?

    
    init() {
        webView = UIWebView(frame: .zero)
        
        url = URL(string: "http://localhost:4000/index.html")!

        startWebServer()
        
        loadUrl()
    }
    
    private func startWebServer() {
        self.webServer = GCDWebServer()
        let mainBundle = Bundle.main
        
        let folderPath = mainBundle.path(forResource: "www", ofType: nil)
        self.webServer?.addGETHandler(forBasePath: "/", directoryPath: folderPath!, indexFilename: "index.html", cacheAge: 0, allowRangeRequests: true)

        do {
            try self.webServer?.start(options: [
                "Port": 4000,
                "BindToLocalhost": true
                ]);
        }catch{
            print(error)
        }

    }
    
    func loadUrl() {
        webView.loadRequest(URLRequest(url: url))
        //webView.load(URLRequest(url: url))
    }
}
