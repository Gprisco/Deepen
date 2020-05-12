//
//  Notifications.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 11/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import UserNotifications

struct FirstQuestion: Codable {
    let question: Evening
    let scheduledAt: Date
}

extension Date {
    var day: Int {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.day, from: self)
    }
}

/*
 MARK: Notification scheduler
 */

func scheduleNotifications() {
    let scheduledQuestion = getData(for: "first_question") ?? nil
    
    if (scheduledQuestion == nil) || scheduledQuestion!.scheduledAt.day != Date().day {
        // Randomizing content
        let morningIndex = Int.random(in: 0 ..< morningQuotes.count)
        let morningQuote = morningQuotes[morningIndex]
        
        let compatibleQuotes = morningQuote.compatible ? eveningQuotes.filter({ $0.morningId == morningQuote.id }) : eveningQuotes.filter({ $0.morningId == nil })
        
        let eveningIndex = Int.random(in: 0 ..< compatibleQuotes.count)
        let eveningQuote = compatibleQuotes[eveningIndex]
        
        let firstQuestion: FirstQuestion = FirstQuestion(question: eveningQuote, scheduledAt: Date())
        write(firstQuestion: firstQuestion, in: "first_question")
        
        schedule(title: "Buongiorno utente!", body: morningQuote.text, at: 15, 03)
        schedule(title: "Buonasera utente!", body: eveningQuote.text, at: 15, 03)
    }
}

func schedule(title: String, body: String, at hour: Int, _ minute: Int) {
    // Content of my Notification
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default
    
    var dateComponents = DateComponents()
    dateComponents.hour = hour
    dateComponents.minute = minute
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    let request = UNNotificationRequest(identifier: title, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}

/*
 MARK: PList handler (for FirstQuestion)
 */

func getUrl(for filename: String) -> URL {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    print(documentsDirectory)
    return documentsDirectory.appendingPathComponent(filename).appendingPathExtension("plist")
}

func write(firstQuestion: FirstQuestion, in filename: String) {
    let propertyListEncoder = PropertyListEncoder()
    let encodedEveningQuote = try? propertyListEncoder.encode(firstQuestion)
    
    try? encodedEveningQuote?.write(to: getUrl(for: filename), options: .noFileProtection)
}

func getData(for filename: String) -> FirstQuestion? {
    let propertyListDecoder = PropertyListDecoder()
    
    if let retrievedData = try? Data(contentsOf: getUrl(for: filename)),
        let decodedFirstQuestion = try? propertyListDecoder.decode(FirstQuestion.self, from: retrievedData) {
        return decodedFirstQuestion
    }
    
    return nil
}
