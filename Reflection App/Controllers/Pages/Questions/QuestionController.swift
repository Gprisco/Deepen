//
//  Page.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 13/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class QuestionController: UIViewController, UITextViewDelegate {
    
    var reflectionDelegate: ReflectionDelegate!

    @IBOutlet var backgroundImage: UIImageView!
    var imageName: String!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var lineWriting: UIView!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundImage.image = UIImage(named: self.imageName)
        
        setupTextView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            self.view.endEditing(true)
            reflectionDelegate.nextStep()
        }
        
        return text != "\n"
    }
    
    func setupTextView() {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: self.view.frame.size.width, height: 30)))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        
        answerTextView.inputAccessoryView = toolbar
        
        answerTextView.isHidden = true
        answerTextView.delegate = self
        
        answerTextView.keyboardType = .default
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
        reflectionDelegate.nextStep()
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
