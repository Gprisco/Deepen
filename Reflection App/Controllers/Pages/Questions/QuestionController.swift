//
//  Page.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 13/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class QuestionController: UIViewController{

    @IBOutlet var backgroundImage: UIImageView!
    var imageName: String!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var lineWriting: UIView!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundImage.image = UIImage(named: self.imageName)
        answerTextView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onWriteTap(_ sender: UIButton) {
        answerTextView.isHidden = false
        lineWriting.isHidden = false
        buttonStackView.isHidden = true
    }
    
    @IBAction func onSpeakTap(_ sender: UIButton) {
        answerTextView.isHidden = false
    }
    
    @IBAction func onSkipTap(_ sender: UIButton) {
        answerTextView.isHidden = false
    }
}
