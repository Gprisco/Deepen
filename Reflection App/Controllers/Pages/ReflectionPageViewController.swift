//
//  PageViewController.swift
//  PageViewController
//
//  Created by Lorenzo on 12/05/2020.
//  Copyright © 2020 Lorenzo Masucci. All rights reserved.
//

import UIKit

class ReflectionPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var historicalDelegate: HistoricalDelegate!
    
    var currentPage: Int = 0
    var maxPage: Int = 3
    
    var pages = [UIViewController]()
    var pageBackgrounds = [String]()
    
    //    MUSIC BUTTON
    let musicButton = UIButton()
    
    func createButton(xFrame: CGFloat, myView: UIView) {
        musicButton.frame = CGRect(x: xFrame - 60, y: 50, width: 50, height: 50)
        musicButton.setImage(UIImage(systemName: "music.note")?.withTintColor(.yellow, renderingMode: .alwaysOriginal)
            , for: UIControl.State.normal)
        musicButton.addTarget(self, action: #selector(musicButtonPressed), for: .touchUpInside)
        myView.addSubview(musicButton)
    }
    
    @objc func musicButtonPressed(sender: UIButton!) {
        if sender.tag == 0 {
            sender.setImage(UIImage(systemName: "speaker.slash.fill")?.withTintColor(.yellow, renderingMode: .alwaysOriginal), for: UIControl.State.normal)
            MusicPlayer.sharedPlayer.stopMusic()
            sender.tag = 1
        } else {
            MusicPlayer.sharedPlayer.playMusic()
            sender.setImage(UIImage(systemName: "music.note")?.withTintColor(.yellow, renderingMode: .alwaysOriginal), for: UIControl.State.normal)
            sender.tag = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //      Create MusicButton
        createButton(xFrame: self.view.frame.size.width, myView: self.view)
        MusicPlayer.sharedPlayer.playMusic()
        
        //        Add BubbleEmitter
        addBubblesAnimation(x: view.bounds.width, y: view.bounds.height, myView: self.view)
        
        let reflect: ViewController = getViewController("reflect")
        let moodQuestionPage: MoodViewController = getViewController("mood")
        let firstQuestionPage: QuestionController = getViewController("question")
        let secondQuestionPage: QuestionController = getViewController("question")
        let reward: RewardController = getViewController("reward")
        
        //    Sorgente
        pages = [reflect, moodQuestionPage, firstQuestionPage, secondQuestionPage, reward]
        pageBackgrounds = ["FirstBackground", "SecondBackground", "ThirdBackground", "FourthBackground", "FifthBackground"]
        
        DispatchQueue.main.async {
            reflect.reflectionDelegate = self
            reflect.historicalDelegate = self.historicalDelegate

            moodQuestionPage.imageName = self.pageBackgrounds[1]
            moodQuestionPage.reflectionDelegate = self
            
            firstQuestionPage.imageName = self.pageBackgrounds[2]
            secondQuestionPage.imageName = self.pageBackgrounds[3]
            reward.imageName = self.pageBackgrounds[4]
        }
        
        self.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    //    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    //
    //
    //
    //        if completed {
    //            pageViewController.view.isUserInteractionEnabled = false
    //            perform(#selector(enableUseInteraction), with: nil, afterDelay: 0.3)
    //        }
    //
    //
    //    }
    //
    //    @objc func enableUseInteraction() {
    //       self.view.isUserInteractionEnabled = true
    //    }
}

extension ReflectionPageViewController: ReflectionDelegate {
    func nextStep() {
        currentPage = currentPage < maxPage ? currentPage + 1 : currentPage
        
        self.setViewControllers([pages[currentPage]], direction: .forward, animated: true)
    }
    
    func prevStep() {
        currentPage = currentPage > 0 ? currentPage - 1 : currentPage
        
        self.setViewControllers([pages[currentPage]], direction: .forward, animated: true)
    }
}
