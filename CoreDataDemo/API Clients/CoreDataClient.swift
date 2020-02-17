//
//  CoreDataClient.swift
//  CoreDataDemo
//
//  Created by Jack Smith on 17/02/2020.
//  Copyright © 2020 Jack Smith. All rights reserved.
//

import Foundation
import CoreData

class CoreDateClient {
    
    // MARK:- Properties
    
    static let shared = CoreDateClient()
    private init() {}
    
    private let mainContext = CoreDataManager.shared.mainContext
    private let backgroundContext = CoreDataManager.shared.backgroundContext()
    
    // MARK:- Methods
    
    public func loadHumans() -> [Human]? {
        let fetchRequest: NSFetchRequest<Human> = Human.fetchRequest()
        do {
            let results = try self.mainContext.fetch(fetchRequest)
            return results
        } catch {
            debugPrint(error)
            return nil
        }
    }
    
    public func createHuman(name: String,
                            birthDate: Date,
                            height: Float,
                            weight: Float,
                            profession: String) throws {
        self.backgroundContext.perform {
            let entity = Human.entity()
            let human = Human(entity: entity, insertInto: self.backgroundContext)
            human.name = name
            human.birthDate = birthDate
            human.age = Int16(self.calculateAge(fromBirthDate: birthDate))
            human.height = height
            human.weight = weight
            human.profession = profession
            do {
                try self.backgroundContext.save()
            } catch {
                debugPrint(error)
            }
        }
    }
    
    // MARK:- Private
    
    private func calculateAge(fromBirthDate date: Date) -> Int {
        let calendar = Calendar.current
        let birthYear = calendar.component(.year, from: date)
        let currentYear = calendar.component(.year, from: Date())
        return currentYear - birthYear
    }
    
}
