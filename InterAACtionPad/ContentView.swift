//
//  ContentView.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 11/11/2021.
//

import SwiftUI
import WebKit
//import EyeTrackKit

//struct WebUIView: View{
//
//    //@ObservedObject var eyeTrackController: EyeTrackController = EyeTrackController(device: Device(type: .iPad), smoothingRange: 10, blinkThreshold: .infinity, isHidden: true)
//    @State var url : URL
//
//    var body: some View{
//        ZStack(alignment: .topLeading)
//        {
//            WebView(url: url)
//            //eyeTrackController.view
//            Circle()
//                 .fill(Color.blue.opacity(0.5))
//                 .frame(width: 25, height: 25)
//                 //.position(x: eyeTrackController.eyeTrack.lookAtPoint.x, y: eyeTrackController.eyeTrack.lookAtPoint.y)
//        }
//    }
//}

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    @State var url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}

struct ContentView: View {
    
    @State var iconSize : Double = 120
    
    var body: some View {
        
        NavigationView {
          List {
              NavigationLink {
                  WebView(url: URL(string: "http://localhost:4000/index.html")!)
              } label: {
                  HStack{
                      Text("AugCom")
                      Image("augCom_Logo")
                          .resizable()
                          .frame(width: iconSize, height: iconSize)
                      
                  }
              }
              NavigationLink {
                  WebView(url: URL(string: "http://localhost:4000/InterAACtionScene/index.html")!)
              } label: {
                  HStack{
                      Text("Visual Scene")
                      Image("visuelSceneDisplay")
                          .resizable()
                          .frame(width: iconSize, height: iconSize)
                      
                  }
              }
              NavigationLink {
                  WebView(url: URL(string: "http://localhost:4000/InterAACtionPlayer/index.html")!)
              } label: {
                  HStack{
                      Text("Media Player")
                      Image("gazeMediaPlayer")
                          .resizable()
                          .frame(width: iconSize, height: iconSize)
                      
                  }
              }
          }
          .navigationTitle("InterAACtionPad")
          .toolbar{
              ToolbarItem(placement: .navigationBarTrailing){
                  Button(action: {
                   })
                  {
                      NavigationLink(destination: WebView(url: URL(string: "http://localhost:4000/index.html")!)) {
                              Image(systemName: "cursorarrow.motionlines.click")
                      }
                  }

              }
          }
        }
    }
}
