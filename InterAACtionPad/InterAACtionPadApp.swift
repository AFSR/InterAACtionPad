//
//  InterAACtionPadApp.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 11/11/2021.
//

import SwiftUI
import GDCWebServer

@main
struct InterAACtionPadApp: App {
    
    let persistenceController = PersistenceController.shared
    @State var webServer = GCDWebServer()
    
    private func startWebServer() {
        let mainBundle = Bundle.main
        
        let folderPath = mainBundle.path(forResource: "www", ofType: nil)
        webServer.addGETHandler(forBasePath: "/", directoryPath: folderPath!, indexFilename: "index.html", cacheAge: 0, allowRangeRequests: true)

        do {
            try webServer.start(options: [
                "Port": 4000,
                "BindToLocalhost": true
                ]);
        }catch{
            print(error)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear{
                    startWebServer()
                }
                .onDisappear{
                    webServer.stop()
                }
        }
    }

}
