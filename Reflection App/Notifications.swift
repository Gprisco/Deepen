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
            
    schedule(title: "Buongiorno utente!", body: morningQuote.text, at: 9, 30)
    schedule(title: "Buonasera utente!", body: eveningQuote.text, at: 19, 30)
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
