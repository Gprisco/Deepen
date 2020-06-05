//
//  Page.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 13/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import Speech
import NotificationCenter

class QuestionController: UIViewController, UITextViewDelegate, SFSpeechRecognizerDelegate {
    
    var reflectionDelegate: ReflectionDelegate!
    var step: Int!
    
    @IBOutlet var backgroundImage: UIImageView!
    var imageName: String!
    
    @IBOutlet weak var questionLabel: UILabel!
    var question: String = "Question"
    
    @IBOutlet weak var answerTextView: UITextView!
    var answer: String = ""
    
    @IBOutlet weak var lineWriting: UIView!
    @IBOutlet weak var writeButtonOutlet: UIButton!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var speechDoneButton: UIButton!
    
    var audioEngine = AVAudioEngine()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundImage.image = UIImage(named: self.imageName)
        
        speechDoneButton.layer.cornerRadius = 10
        speechDoneButton.clipsToBounds = true
        setupTextView()
        registerForKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = question
        answerTextView.text = answer
        
        writeButtonOutlet.backgroundColor = .none
        writeButtonOutlet.layer.cornerRadius = 10
        
        //        Add BubbleEmitter
        addBubblesAnimation(x: view.bounds.width, y: view.bounds.height, myView: self.view)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        buttonStackView.isHidden = false
        answerTextView.isHidden = true
        lineWriting.isHidden = true
        
        deregisterFromKeyboardNotifications()
    }
    
    @IBAction func crossButtonPressed(_ sender: UIButton) {
        reflectionDelegate.clearFlow()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        answer = text
        
        return true
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        doneButtonAction()
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
        
        if step == 1 {
            reflectionDelegate.onFirstAnswer(answerTextView.text)
        } else if step == 2 {
            reflectionDelegate.onSecondAnswer(answerTextView.text)
        }
        
        answerTextView.isHidden = true
        lineWriting.isHidden = true
        buttonStackView.isHidden = false
        audioEngine.stop()
        reflectionDelegate.nextStep()
    }
    
    @IBAction func onWriteTap(_ sender: UIButton) {
        answerTextView.isHidden = false
        lineWriting.isHidden = false
        buttonStackView.isHidden = true
        answerTextView.becomeFirstResponder()
    }
    
    @IBAction func onSpeakTap(_ sender: UIButton) {
        buttonStackView.isHidden = true
        answerTextView.isHidden = false
        lineWriting.isHidden = false
        self.recordAndRecognizeSpeech()
    }
    
    @IBAction func onSkipTap(_ sender: UIButton) {
        reflectionDelegate.nextStep()
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch { }
    }
    
    func recordAndRecognizeSpeech() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    AVAudioSession.sharedInstance().requestRecordPermission { granted in
                        if granted {
                            self.configureAudioSession()
                            print("Good to go!")
                            
                            let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
                            let request = SFSpeechAudioBufferRecognitionRequest()
                            
                            let node = self.audioEngine.inputNode
                            let recordingFormat = node.inputFormat(forBus: 0)
                            node.installTap (onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                                request.append(buffer)
                            }
                            
                            self.audioEngine.prepare()
                            do {
                                try self.audioEngine.start()
                            } catch {
                                return print (error)
                            }
                            
                            guard let myRecognizer = SFSpeechRecognizer() else {
                                return
                            }
                            
                            if !myRecognizer.isAvailable {
                                return
                            }
                            
                            speechRecognizer!.recognitionTask(with: request, resultHandler: { result, error in
                                if let result = result {
                                    let bestString = result.bestTranscription.formattedString
                                    
                                    self.answerTextView.text = bestString
                                } else if let error = error {
                                    print (error)
                                }
                            })
                            
                        } else {
                            print("Transcription permission was declined.")
                            self.buttonStackView.isHidden = false
                            self.answerTextView.isHidden = true
                            self.lineWriting.isHidden = true
                        }
                    }
                } else {
                    print("Transcription permission was declined.")
                    self.buttonStackView.isHidden = false
                    self.answerTextView.isHidden = true
                    self.lineWriting.isHidden = true
                }
            }
        }
    }
    
    func registerForKeyboardNotifications() {
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func deregisterFromKeyboardNotifications() {
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        //Need to calculate keyboard exact size due to Apple suggestions
        self.answerTextView.isScrollEnabled = true
        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize!.height, right: 0.0)
        
        self.answerTextView.contentInset = contentInsets
        self.answerTextView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        
        if let activeField = self.answerTextView {
            if (!aRect.contains(activeField.frame.origin)){
                self.answerTextView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        //Once keyboard disappears, restore original positions
        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize!.height, right: 0.0)
        self.answerTextView.contentInset = contentInsets
        self.answerTextView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.answerTextView.isScrollEnabled = false
    }
}
