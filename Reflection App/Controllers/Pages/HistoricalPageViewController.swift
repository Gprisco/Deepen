//
//  MainPageViewController.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 19/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class HistoricalPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    var reflections = Reflections()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reflectView: ReflectionPageViewController = getViewController("reflectionPageViewController")
        let historicalView: HistoricalViewController = getViewController("historical")
        
        reflections = Reflection.shared.getReflections()!
        
        DispatchQueue.main.async {
            reflectView.historicalDelegate = self
            
            historicalView.historicalDelegate = self
            historicalView.reflections = Array(self.reflections[0..<7])
        }
        
        pages = [historicalView, reflectView]
        self.setViewControllers([pages[1]], direction: .forward, animated: true)
    }
    
    //    Hide Status-Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension HistoricalPageViewController: HistoricalDelegate {
    func onHistoricalPress() {
        let historicalPage = pages[0] as! HistoricalViewController
        historicalPage.reflections = self.reflections
        
        self.setViewControllers([historicalPage], direction: .reverse, animated: true)
    }
    
    func onReflectPress() {
        self.setViewControllers([pages[1]], direction: .forward, animated: true)
    }
    
    func saveReflection(_ reflection: Reflection?) {
        if reflection != nil {
            self.reflections.insert(reflection!, at: reflections.count)
        }
    }
}
