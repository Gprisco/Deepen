//
//  Reflection+CoreDataProperties.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 14/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//
//

import UIKit
import CoreData

typealias Reflections = [Reflection]

extension Reflection {
    
    @nonobjc public class func getFetchRequest() -> NSFetchRequest<Reflection> {
        return NSFetchRequest<Reflection>(entityName: "Reflection")
    }
    
    @NSManaged public var firstAnswer: String?
    @NSManaged public var firstQuestion: String?
    @NSManaged public var mood: String?
    @NSManaged public var moodImage: String?
    @NSManaged public var category: String?
    @NSManaged public var categoryImage: String?
    @NSManaged public var secondAnswer: String?
    @NSManaged public var secondQuestion: String?
    @NSManaged public var date: Date?
    @NSManaged public var reward: String?
    
    /*
     MARK: CRUD operations on Reflections
     */
    
    // Create
    func addReflection(mood: String, moodImage: String, category: String, categoryImage: String, firstQuestion: String, firstAnswer: String, secondQuestion: String, secondAnswer: String, reward: String) -> Reflection? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        
        let reflection = Reflection(context: context)
        
        reflection.mood = mood
        reflection.moodImage = moodImage
        reflection.category = category
        reflection.categoryImage = categoryImage
        reflection.firstQuestion = firstQuestion
        reflection.firstAnswer = firstAnswer
        reflection.secondQuestion = secondQuestion
        reflection.secondAnswer = secondAnswer
        reflection.date = Date()
        reflection.reward = reward
        
        do {
            try context.save()
            return reflection
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }

    // Read
    func getReflections() -> Reflections? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        
        let request = Reflection.getFetchRequest()
        
        do {
            let fetchedResult = try context.fetch(request)
            print(fetchedResult)
            return fetchedResult
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
        
    // Update
    func updateReflection(_ reflection: Reflection, mood: String, moodImage: String, firstQuestion: String, firstAnswer: String, secondQuestion: String, secondAnswer: String) -> Reflection? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        
        reflection.mood = mood
        reflection.moodImage = moodImage
        reflection.category = category
        reflection.categoryImage = categoryImage
        reflection.firstQuestion = firstQuestion
        reflection.firstAnswer = firstAnswer
        reflection.secondQuestion = secondQuestion
        reflection.secondAnswer = secondAnswer
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        return reflection
    }
    
    // Delete
    func deleteReflection(_ reflection: Reflection) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(reflection)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

/* USAGE EXAMPLE
 CREATE
 Reflection.shared.addReflection(mood: "bello", moodImage: "ciao", firstQuestion: "ciao", firstAnswer: "ciao", secondQuestion: "ciao", secondAnswer: "ciao")
 
 READ
 var reflections = Reflection.shared.getReflections()
 
 UPDATE (i'm updating the first reflection)
 Reflection.shared.updateReflection(reflections![0], mood: "DONSVNEFNDWJNVJEFRG", moodImage: "ciao", firstQuestion: "ciao", firstAnswer: "ciao", secondQuestion: "ciao", secondAnswer: "ciao")
 
 DELETE (i'm deleting every reflection here)
 for r in reflections! {
     Reflection.shared.deleteReflection(r)
 }
 */
