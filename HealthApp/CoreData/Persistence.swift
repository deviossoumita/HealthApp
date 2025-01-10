//
//  Persistence.swift
//  HealthApp
//
//  Created by Soumita on 09/01/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "HealthCare")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Error loading CoreData: \(error.localizedDescription)")
            }
        }
    }
}
