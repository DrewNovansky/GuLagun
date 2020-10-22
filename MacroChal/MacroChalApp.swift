//
//  MacroChalApp.swift
//  MacroChal
//
//  Created by Andrew Novansky Ignatius on 01/10/20.
//

import SwiftUI

@main
struct MacroChalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            EmotionPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
