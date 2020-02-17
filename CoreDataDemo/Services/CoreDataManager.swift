//
//  CoreDataMAnager.swift
//  CoreDataDemo
//
//  Created by Jack Smith on 17/02/2020.
//  Copyright © 2020 Jack Smith. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // MARK:- Properties
    
    static let shared = CoreDataManager()
    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Town")
        container.loadPersistentStores(completionHandler: { _, error in
            _ = error.map { fatalError("Unresolved error \($0)") }
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK:- Methods
    
    func backgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
}
