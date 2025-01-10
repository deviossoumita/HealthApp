//
//  HealthAppApp.swift
//  HealthApp
//
//  Created by Soumita on 10/01/25.
//

import SwiftUI

@main
struct HealthAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
