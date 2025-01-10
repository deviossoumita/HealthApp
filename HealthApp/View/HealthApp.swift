//
//  HealthCareApp.swift
//  HealthApp
//
//  Created by Soumita on 09/01/25.
//

import SwiftUI
import CoreData
import Charts

@main
struct HealthApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
