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
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let reflectView: ReflectionPageViewController = getViewController("reflectionPageViewController")
        let historicalView: HistoricalViewController = getViewController("historical")
        
        DispatchQueue.main.async {
            reflectView.historicalDelegate = self
            historicalView.historicalDelegate = self
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
        self.setViewControllers([pages[0]], direction: .reverse, animated: true)
    }
    
    func onReflectPress() {
        self.setViewControllers([pages[1]], direction: .forward, animated: true)
    }
}
