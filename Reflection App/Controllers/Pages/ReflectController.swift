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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Button Constraints start
        self.historicalButtonOutlet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 20).isActive = true
        
        NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 35).isActive = true
        
        NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        NSLayoutConstraint(item: self.historicalButtonOutlet!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        // Button Constraints end
        
        backgroundImage.image = UIImage(named: "animazione-onde1")
        
        move = getImageNames(for: "animazione-onde", frames: 116, loop: false)
        
        backgroundImage.animationImages = move
        backgroundImage.animationDuration = 6
        
        buttonToPress.setImage(UIImage(named: "Animazione-piuma1"), for: .normal)
        
        moveB = getImageNames(for: "Animazione-piuma", frames: 123, loop: false)
        
        buttonToPress.imageView?.animationDuration = 4
        buttonToPress.imageView?.animationImages = moveB
        
        self.backgroundImage.startAnimating()
        self.buttonToPress.imageView?.startAnimating()
        
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
}

