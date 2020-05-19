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
    
    @IBOutlet var backgroundImage: UIImageView!
    var imageString: String = "FirstBackground"
    
    var historicalDelegate: HistoricalDelegate!
    var reflectionDelegate: ReflectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            let status = settings.authorizationStatus
            if status == .denied || status == .notDetermined {
                DispatchQueue.main.async {
                    self.accessDeniedAlert()
                }
                return
            }
        }
        
        backgroundImage.image = UIImage(named: imageString)
        
//        let firstQuestions: FirstQuestions = getData(for: "first_question") ?? []
//        let firstQuestion = firstQuestions.last(where: { $0.scheduledAt.day == Date().day })
//
//        firstQuestionLabel.text = firstQuestion?.question.text ?? eveningQuotes[Int.random(in: 0 ..< eveningQuotes.count)].text
//        firstQuestionLabel.isHidden = true
    }
    
    @IBAction func reflectButtonPressed(_ sender: UIButton) {
        reflectionDelegate.nextStep()
    }
    
    @IBAction func historicalButtonPressed(_ sender: UIButton) {
        historicalDelegate.onHistoricalPress()
    }
    
    //    Nel caso di Notifiche disattivate viene presentato un alert che informa l'utente
    func accessDeniedAlert() {
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

