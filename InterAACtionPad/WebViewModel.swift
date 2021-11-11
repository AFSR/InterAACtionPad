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
    let webView: WKWebView
    let url: URL
    
    var webServer:GCDWebServer?

    
    init() {
        webView = WKWebView(frame: .zero)
        //url = URL(string: "https://afsr.fr")!
        
        //url = URLRequest(url: loadDefaultIndexFile() ?? URL(string: "https://afsr.fr") ).url!
        url = URL(string: "http://localhost:3000/index.html")!

        startWebServer()
        
        
        loadUrl()
    }
    
    private func startWebServer() {
        self.webServer = GCDWebServer()
        let mainBundle = Bundle.main
        // The path to my index.html is www/index.html.  If using a default public folder then it could be public/index.html
        let folderPath = mainBundle.path(forResource: "www", ofType: nil)
        self.webServer?.addGETHandler(forBasePath: "/", directoryPath: folderPath!, indexFilename: "index.html", cacheAge: 0, allowRangeRequests: true)

        do {
            try self.webServer?.start(options: [
                "Port": 3000,
                "BindToLocalhost": true
                ]);
        }catch{
            print(error)
        }

    }
    
    private func loadDefaultIndexFile() -> URL? {
        self.webServer = GCDWebServer()
        let mainBundle = Bundle.main
        // The path to my index.html is www/index.html.  If using a default public folder then it could be public/index.html
        let folderPath = mainBundle.path(forResource: "www", ofType: nil)
        self.webServer?.addGETHandler(forBasePath: "/", directoryPath: folderPath!, indexFilename: "index.html", cacheAge: 0, allowRangeRequests: true)

        do {
            try self.webServer?.start(options: [
                "Port": 3000,
                "BindToLocalhost": true
                ]);
        }catch{
            print(error)
        }

    // Path should be http://localhost:3000/index.html
    return self.webServer?.serverURL
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
}
