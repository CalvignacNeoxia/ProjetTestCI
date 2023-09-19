//
//  MockCoreDataStack.swift
//  P10_Application_de_recetteTests
//
//

import P10_Application_de_recette
import Foundation
import CoreData

final class MockCoreDataStack: NSObject {
    
    lazy var persistentContainer: NSPersistentContainer = {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            let container = NSPersistentContainer(name: "P10_Application_de_recette")
            container.persistentStoreDescriptions = [description]
            container.loadPersistentStores { _, error in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            }
            return container
        }()
}
