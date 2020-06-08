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
    let scheduledFor: Date
}

typealias FirstQuestions = [FirstQuestion]

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
    var scheduledQuestions = getData(for: "first_question") ?? nil
    // Randomizing content
    
    if (scheduledQuestions == nil) || scheduledQuestions!.last!.scheduledAt.day != Date().day {
        let today = Date()
        
        // Randomizing content
        let morningIndex = Int.random(in: 0 ..< morningQuotes.count)
        let morningQuote = morningQuotes[morningIndex]
        
        let compatibleQuotes = morningQuote.compatible ? eveningQuotes.filter({ $0.morningId == morningQuote.id }) : eveningQuotes.filter({ $0.morningId == nil })
        
        let eveningIndex = Int.random(in: 0 ..< compatibleQuotes.count)
        let eveningQuote = compatibleQuotes[eveningIndex]
        
        let newFirstQuestion: FirstQuestion = FirstQuestion(question: eveningQuote, scheduledAt: today, scheduledFor: today.advanced(by: TimeInterval(3600*24)))
        
        scheduledQuestions = scheduledQuestions == nil ? [] : scheduledQuestions!
        
        scheduledQuestions!.append(newFirstQuestion)
        write(firstQuestion: scheduledQuestions!, in: "first_question")
        
        schedule(title: "\(NSLocalizedString("Good Morning", comment: "Morning title notification")) \(NSUserName())!", body: morningQuote.text, at: 9, 30, for: today.day+1)
        schedule(title: "\(NSLocalizedString("Good Evening", comment: "Evening title notification")) \(NSUserName())!", body: eveningQuote.text, at: 19, 30, for: today.day+1)
    }
}

func schedule(title: String, body: String, at hour: Int, _ minute: Int, for day: Int) {
    // Content of my Notification
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default
    
    var dateComponents = DateComponents()
    dateComponents.day = day
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
    return documentsDirectory.appendingPathComponent(filename).appendingPathExtension("plist")
}

func write(firstQuestion: FirstQuestions, in filename: String) {
    let propertyListEncoder = PropertyListEncoder()
    let encodedEveningQuote = try? propertyListEncoder.encode(firstQuestion)
    
    try? encodedEveningQuote?.write(to: getUrl(for: filename), options: .noFileProtection)
}

func getData(for filename: String) -> FirstQuestions? {
    let propertyListDecoder = PropertyListDecoder()
    
    if let retrievedData = try? Data(contentsOf: getUrl(for: filename)),
        let decodedFirstQuestions = try? propertyListDecoder.decode(FirstQuestions.self, from: retrievedData) {
        for i in decodedFirstQuestions {
            print(i.question.text)
        }
        
        return decodedFirstQuestions
    }
    
    return nil
}
