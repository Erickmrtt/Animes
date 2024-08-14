//
//  AnimeApp.swift
//  Anime
//
//  Created by erick on 12/08/24.
//

import SwiftUI

@main
struct AnimeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
