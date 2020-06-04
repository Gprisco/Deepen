//
//  ReflectionDetailsViewController.swift
//  Reflection App
//
//  Created by Lorenzo on 04/06/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class ReflectionDetailsViewController: UIViewController {
    var reflection: Reflection!
    
    @IBOutlet weak var firstQuestion: UILabel!
    @IBOutlet weak var secondQuestion: UILabel!
    @IBOutlet weak var firstAnswer: UITextView!
    @IBOutlet weak var secondAnswer: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstAnswer.text = reflection.firstAnswer ?? ""
        secondAnswer.text = reflection.secondAnswer ?? ""
    }
}
