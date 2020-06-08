//
//  PageViewController.swift
//  PageViewController
//
//  Created by Lorenzo on 12/05/2020.
//  Copyright © 2020 Lorenzo Masucci. All rights reserved.
//

import UIKit

class ReflectionPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var historicalDelegate: HistoricalDelegate!
    
    var currentPage: Int = 0
    var maxPage: Int = 5
    
    var pages = [UIViewController]()
    var pageBackgrounds = [String]()
    
    var firstAnswer: String?
    var mood: String?
    var moodImage: String?
    var category: String?
    var categoryImage: String?
    var secondAnswer: String?
    var reward: String?
    
    //    MUSIC BUTTON
    let musicButton = UIButton()
    
    func createButton(xFrame: CGFloat, myView: UIView) {        
        musicButton.frame = CGRect(x: xFrame - 50, y: 60, width: 50, height: 50)
        musicButton.setImage(UIImage(systemName: "music.note")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            , for: UIControl.State.normal)
        musicButton.addTarget(self, action: #selector(musicButtonPressed), for: .touchUpInside)
        myView.addSubview(musicButton)
    }
    
    @objc func musicButtonPressed(sender: UIButton!) {
        if sender.tag == 0 {
            sender.setImage(UIImage(systemName: "speaker.slash.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal), for: UIControl.State.normal)
            MusicPlayer.sharedPlayer.stopMusic()
            sender.tag = 1
        } else {
            MusicPlayer.sharedPlayer.playMusic()
            sender.setImage(UIImage(systemName: "music.note")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal), for: UIControl.State.normal)
            sender.tag = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //      Create MusicButton
        createButton(xFrame: self.view.frame.size.width, myView: self.view)
        MusicPlayer.sharedPlayer.playMusic()
        
        //        Constraint MusicButton
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: musicButton, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: musicButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: musicButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: musicButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        let reflect: ReflectController = getViewController("reflect")
        let firstQuestionPage: QuestionController = getViewController("question")
        let moodQuestionPage: MoodViewController = getViewController("mood")
        let categoryQuestionPage: MoodViewController = getViewController("mood")
        let secondQuestionPage: QuestionController = getViewController("question")
        let reward: RewardController = getViewController("reward")
        
        //    Sorgente
        pages = [reflect, firstQuestionPage, moodQuestionPage, categoryQuestionPage, secondQuestionPage, reward]
        pageBackgrounds = ["FirstBackground", "SecondBackground", "ThirdBackground", "FourthBackground", "FifthBackground"]
        
        self.reward = "Stay hungry, stay foolish.\n- Steve Jobs"
        
        DispatchQueue.main.async {
            reflect.reflectionDelegate = self
            reflect.historicalDelegate = self.historicalDelegate
            
            firstQuestionPage.imageName = self.pageBackgrounds[1]
            firstQuestionPage.reflectionDelegate = self
            firstQuestionPage.question = NSLocalizedString("How did it go today?", comment: "First Question")
            firstQuestionPage.step = 1
            
            moodQuestionPage.backgroundImageName = self.pageBackgrounds[2]
            moodQuestionPage.moodImages = ["stressato", "impaurito", "fortunato", "felice", "energico", "depresso", "confuso", "benedetto", "arrabbiato"]
            moodQuestionPage.moods = ["Stressed", "Scared", "Lucky", "Happy", "Energic", "Depressed", "Confused", "Blessed", "Angry"]
            moodQuestionPage.type = "mood"
            moodQuestionPage.sectionTitleString = NSLocalizedString("How do you feel today?", comment: "First mood")
            moodQuestionPage.reflectionDelegate = self
            
            categoryQuestionPage.backgroundImageName = self.pageBackgrounds[2]
            categoryQuestionPage.moodImages = ["stressato", "impaurito", "fortunato", "felice", "energico", "depresso", "confuso", "benedetto", "arrabbiato"]
            categoryQuestionPage.moods = ["Work", "Health", "Relationship", "Study", "Choose for me"]
            categoryQuestionPage.type = "category"
            categoryQuestionPage.sectionTitleString = NSLocalizedString("What do you want to talk about?", comment: "Second mood")
            categoryQuestionPage.reflectionDelegate = self
            
            secondQuestionPage.imageName = self.pageBackgrounds[3]
            secondQuestionPage.reflectionDelegate = self
            secondQuestionPage.question = NSLocalizedString("What would you have changed?", comment: "Second Question")
            secondQuestionPage.step = 2
            
            reward.imageName = self.pageBackgrounds[4]
            reward.reflectionDelegate = self
            reward.rewardText = self.reward!
        }
        
        self.dataSource = self
        
        self.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex - 1
        
        guard nextIndex >= 0 else {
            return nil
        }
        
        currentPage = nextIndex
        
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}

extension ReflectionPageViewController: ReflectionDelegate {
    func nextStep() {
        currentPage = currentPage < maxPage ? currentPage + 1 : currentPage
        
        self.setViewControllers([pages[currentPage]], direction: .forward, animated: true, completion: { success in
            if let transiton = self.transitionCoordinator {
                print(transiton.transitionDuration)
            }
        })
    }
    
    func prevStep() {
        currentPage = currentPage > 0 ? currentPage - 1 : currentPage
        self.setViewControllers([pages[currentPage]], direction: .forward, animated: true)
    }
    
    func clearFlow() {
        currentPage = 0
        
        firstAnswer = nil
        mood = nil
        moodImage = nil
        category = nil
        categoryImage = nil
        secondAnswer = nil
        reward = nil
        
        self.setViewControllers([pages[0]], direction: .reverse, animated: true, completion: nil)
    }
    
    func onMoodChoice(mood: String, moodImage: String) {
        self.mood = mood
        self.moodImage = moodImage
    }
    
    func onCategoryChoice(category: String, categoryImage: String) {
        self.category = category
        self.categoryImage = categoryImage
    }
    
    func onFirstAnswer(_ answer: String) {
        self.firstAnswer = answer
    }
    
    func onSecondAnswer(_ answer: String) {
        self.secondAnswer = answer
    }
    
    func onReflectionFinished() {
        currentPage = 0
        self.setViewControllers([pages[0]], direction: .reverse, animated: true, completion: nil)
        
        let reflection = Reflection.shared.addReflection(mood: mood ?? "", moodImage: moodImage ?? "", category: category ?? "", categoryImage: categoryImage!, firstQuestion: "How did it go today?", firstAnswer: firstAnswer ?? "", secondQuestion: "What would you have changed?", secondAnswer: secondAnswer ?? "", reward: reward ?? "")
        
        historicalDelegate.saveReflection(reflection ?? nil)
    }
}
