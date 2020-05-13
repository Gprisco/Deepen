//
//  PageViewController.swift
//  PageViewController
//
//  Created by Lorenzo on 12/05/2020.
//  Copyright © 2020 Lorenzo Masucci. All rights reserved.
//

import UIKit

func getViewController<T>(_ identifier: String) -> T {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifier) as! T
}

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pages = [UIViewController]()
    var pageBackgrounds = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reflect: ViewController = getViewController("reflect")
        let moodQuestionPage: QuestionController = getViewController("question")
        let firstQuestionPage: QuestionController = getViewController("question")
        let secondQuestionPage: QuestionController = getViewController("question")
        let reward: RewardController = getViewController("reward")
        
        //    Sorgente
        pages = [reflect, moodQuestionPage, firstQuestionPage, secondQuestionPage, reward]
        pageBackgrounds = ["FirstBackground", "SecondBackground", "ThirdBackground", "FourthBackground", "FifthBackground"]
        
        //        Assegno DataSource
        self.dataSource = self
        
        DispatchQueue.main.async {
            reflect.backgroundImage.image = UIImage(named: self.pageBackgrounds[0])
            moodQuestionPage.imageName = self.pageBackgrounds[1]
            firstQuestionPage.imageName = self.pageBackgrounds[2]
            secondQuestionPage.imageName = self.pageBackgrounds[3]
            reward.imageName = self.pageBackgrounds[4]
        }
        
        self.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    //    ViewController Precedente
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex - 1
        
        guard nextIndex >= 0 else {
            return nil
        }
        
        return pages[nextIndex]
    }
    
    //       ViewController successivo
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        let maxPage = pages.count
        
        guard nextIndex != maxPage else {
            return nil
        }
        
        return pages[nextIndex]
    }
}
