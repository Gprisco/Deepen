//
//  Notifications.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 11/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import UserNotifications

//    Start my personal Notification
func scheduleNotifications() {
    let morningIndex = Int.random(in: 0 ..< morningQuotes.count)
    let morningQuote = morningQuotes[morningIndex]
    
    let compatibleQuotes = morningQuote.compatible ? eveningQuotes.filter({ $0.morningId == morningQuote.id }) : eveningQuotes.filter({ $0.morningId == nil })
    
    let eveningIndex = Int.random(in: 0 ..< compatibleQuotes.count)
    let eveningQuote = compatibleQuotes[eveningIndex]
            
    schedule(title: "Buongiorno utente!", body: morningQuote.text, at: 12, 15)
    schedule(title: "Buonasera utente!", body: eveningQuote.text, at: 12, 16)
    
    //    Saving First Question (Evening) - PLIST method
    
//1  Create a new plist File
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let archiveURL = documentsDirectory.appendingPathComponent("first_question").appendingPathExtension("plist")
    
//2  Create Encoder to encode my eveningQuote
    let propertyListEncoder = PropertyListEncoder()
    let encodedEveningQuote = try? propertyListEncoder.encode(eveningQuote)
    
//3  Write my eveningQuote to the file I've created before
//    .noFileProtection allow the file to be overwritten in the future if my quote change
    try? encodedEveningQuote?.write(to: archiveURL, options: .noFileProtection)
//4   To retrieve the saved file I'm creating a Decoder
    let propertyListDecoder = PropertyListDecoder()
    
    if let retrievedData = try? Data(contentsOf: archiveURL),
        let decodedEveningQuoteData = try? propertyListDecoder.decode(Evening.self, from: retrievedData) {
        print(decodedEveningQuoteData)
    }
     
}




func schedule(title: String, body: String, at hour: Int, _ minute: Int) {
    //        Content of my Notification
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
