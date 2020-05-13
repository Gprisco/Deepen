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
    
    var pages: [UIViewController]!
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reflect: ViewController = getViewController("reflect")
        reflect.backgroundImage.image = UIImage(named: "FirstBackground")
        
        let moodQuestionPage: Page = getViewController("question")
        moodQuestionPage.backgroundImage.image = UIImage(named: "SecondBackground")
        
        let firstQuestionPage: Page = getViewController("question")
        firstQuestionPage.backgroundImage.image = UIImage(named: "ThirdBackground")
        
        let secondQuestionPage: Page = getViewController("question")
        secondQuestionPage.backgroundImage.image = UIImage(named: "FourthBackground")
        
        let reward: Page = getViewController("reward")
        reward.backgroundImage.image = UIImage(named: "FifthBackground")
                
        //    Sorgente
        pages = [reflect, moodQuestionPage, firstQuestionPage, secondQuestionPage, reward]
        
        //        Assegno DataSource
        self.dataSource = self
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.setViewControllers(pages, direction: .forward, animated: true, completion: nil)
    }
    
    //    ViewController Precedente
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let nextIndex = currentIndex - 1
        
        guard nextIndex >= 0 else {
            return nil
        }
        
        self.currentIndex = nextIndex
        return pages[nextIndex]
    }
    
    //       ViewController successivo
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        let nextIndex = currentIndex + 1
        let maxPage = pages.count
        
        guard nextIndex != maxPage else {
            return nil
        }
        
        self.currentIndex = nextIndex
        return pages[nextIndex]
    }
}
