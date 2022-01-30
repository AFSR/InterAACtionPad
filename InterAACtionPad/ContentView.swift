//
//  ContentView.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 11/11/2021.
//

import SwiftUI
import WebKit
import EyeTrackKit

struct WebUIView: View{

    @ObservedObject var eyeTrackController: EyeTrackController = EyeTrackController(device: Device(type: .iPadLandscape), smoothingRange: 10, blinkThreshold: .infinity, isHidden: true)
    @State var url : URL

    var body: some View{
        ZStack(alignment: .topLeading)
        {
            WebView(url: url)
            eyeTrackController.view
            Circle()
                 .fill(Color.blue.opacity(0.5))
                 .frame(width: 25, height: 25)
                 .position(x: eyeTrackController.eyeTrack.lookAtPoint.x, y: eyeTrackController.eyeTrack.lookAtPoint.y)
        }
    }
}

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
    
    @State var iconSize : Double = UIScreen.main.bounds.height/6
    
    var body: some View {
        
        NavigationView {
          List {
              NavigationLink {
                  WebUIView(url: URL(string: "http://localhost:4000/index.html")!)
              } label: {
                  HStack{
                      Image("augCom_Logo")
                          .resizable()
                          .frame(width: iconSize, height: iconSize)
                      Text("AugCom")
                  }
              }
              NavigationLink {
                  WebUIView(url: URL(string: "http://localhost:4000/InterAACtionScene/index.html")!)
              } label: {
                  HStack{
                      
                      Image("visuelSceneDisplay")
                          .resizable()
                          .frame(width: iconSize, height: iconSize)
                      Text("Visual Scene")
                  }
              }
              NavigationLink {
                  WebUIView(url: URL(string: "http://localhost:4000/InterAACtionPlayer/index.html")!)
              } label: {
                  HStack{
                      
                      Image("gazeMediaPlayer")
                          .resizable()
                          .frame(width: iconSize, height: iconSize)
                      Text("Media Player")
                  }
              }
          }
          .navigationTitle("InterAACtionPad")
          .toolbar{
              ToolbarItem(placement: .navigationBarTrailing){
                  Button(action: {
                   })
                  {
                      NavigationLink(destination: CalibrationView()) {
                              Image(systemName: "cursorarrow.motionlines.click")
                      }
                  }

              }
          }
        }
    }
}
