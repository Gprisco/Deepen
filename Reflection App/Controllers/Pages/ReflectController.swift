//
//  ViewController.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 08/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import UserNotifications

class ReflectController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet weak var buttonToPress: UIButton!
    
    var move : [UIImage] = []
    var moveB : [UIImage] = []
    
    var historicalDelegate: HistoricalDelegate!
    var reflectionDelegate: ReflectionDelegate!
    @IBOutlet weak var historicalButtonOutlet: UIButton!
    

      
    
    
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
            
            //        Constraint Historical Button
            
            DispatchQueue.main.async {
                self.historicalButtonOutlet.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: -10).isActive = true
                
                NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0).isActive = true
                
                NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
                
                NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
                
            }
            
        }
        
        backgroundImage.image = UIImage(named: "animazione-onde1")
        
        move = [UIImage(named: "animazione-onde1")!, UIImage(named: "animazione-onde2")!, UIImage(named: "animazione-onde3")!, UIImage(named: "animazione-onde4")!, UIImage(named: "animazione-onde5")!, UIImage(named: "animazione-onde6")!, UIImage(named: "animazione-onde7")!, UIImage(named: "animazione-onde8")!, UIImage(named: "animazione-onde9")!, UIImage(named: "animazione-onde10")!, UIImage(named: "animazione-onde11")!, UIImage(named: "animazione-onde12")!, UIImage(named: "animazione-onde11")!, UIImage(named: "animazione-onde10")!, UIImage(named: "animazione-onde9")!, UIImage(named: "animazione-onde8")!, UIImage(named: "animazione-onde7")!, UIImage(named: "animazione-onde6")!, UIImage(named: "animazione-onde5")!, UIImage(named: "animazione-onde4")!, UIImage(named: "animazione-onde3")!, UIImage(named: "animazione-onde2")!]
        
        backgroundImage.animationImages = move
        backgroundImage.animationDuration = 6
        
        buttonToPress.setImage(UIImage(named: "Animazione-piuma1"), for: .normal)
        
        moveB = [UIImage(named: "Animazione-piuma1")!, UIImage(named: "Animazione-piuma2")!, UIImage(named: "Animazione-piuma3")!, UIImage(named: "Animazione-piuma4")!, UIImage(named: "Animazione-piuma5")!, UIImage(named: "Animazione-piuma6")!]
        
        buttonToPress.imageView?.animationDuration = 1
        buttonToPress.imageView?.animationImages = moveB
        
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now()+0.5){
            self.backgroundImage.startAnimating()
            self.buttonToPress.imageView?.startAnimating()
        }
        
        
        //        let firstQuestions: FirstQuestions = getData(for: "first_question") ?? []
        //        let firstQuestion = firstQuestions.last(where: { $0.scheduledAt.day == Date().day })
        //
        //        firstQuestionLabel.text = firstQuestion?.question.text ?? eveningQuotes[Int.random(in: 0 ..< eveningQuotes.count)].text
        //        firstQuestionLabel.isHidden = true
    }
    
    @IBAction func reflectButtonPressed(_ sender: UIButton) {
        //        backgroundImage.stopAnimating()
        //        buttonToPress.imageView?.stopAnimating()
        reflectionDelegate.nextStep()
    }
    
    @IBAction func historicalButtonPressed(_ sender: UIButton) {
        historicalDelegate.onHistoricalPress()
    }
    
    //    Nel caso di Notifiche disattivate viene presentato un alert che informa l'utente
    func accessDeniedAlert() {
        let alert = UIAlertController(title: "Deepen", message: "Deepen ha bisogno delle notifiche per funzionare al meglio. Attivale nelle impostazioni.", preferredStyle: .alert)
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

