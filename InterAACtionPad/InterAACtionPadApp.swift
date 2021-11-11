//
//  InterAACtionPadApp.swift
//  InterAACtionPad
//
//  Created by Julien Fieschi on 11/11/2021.
//

import SwiftUI

@main
struct InterAACtionPadApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
