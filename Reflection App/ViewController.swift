//
//  ViewController.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 08/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        }
        
        
    
    
    @IBAction func notifyButtonPressed(_ sender: Any) {
//        Control if the user has authorized the Notification
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            let status = settings.authorizationStatus
            if status == .denied || status == .notDetermined {
                DispatchQueue.main.async {
                    self.accessDeniedAlert()
                }
                return
            }
            self.myNotification()
        }
    }
    
//    Start my personal Notification
    func myNotification() {
//        Content of my Notification
        let content = UNMutableNotificationContent()
        content.title = "Buongiorno Utente"
        content.body = "Cosa ne pensi se oggi conosciamo una nuova persona?"
        content.sound = UNNotificationSound.default

/*      IN THE CASE WE NEED TO PROGRAM EVERY DAY AT 9:30
         
        var dateComponents = DateComponents()
        dateComponents.hour = 09
        dateComponents.minute = 30
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
         
*/
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: "Buongiorno", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
//    Nel caso di Notifiche disattivate viene presentato un alert che informa l'utente
    func accessDeniedAlert(){
           let alert = UIAlertController(title: "ReflectApp", message: "Reflect APP ha bisogno delle notifiche per funzionare al meglio. Attivale nelle impostazioni.", preferredStyle: .alert)
           let okayAction = UIAlertAction(title: "Annulla", style: .default, handler: nil)
           let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
               if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                   UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
               }
           }
           alert.addAction(okayAction)
           alert.addAction(settingsAction)
           present(alert, animated: true) {
           }
       }

}

