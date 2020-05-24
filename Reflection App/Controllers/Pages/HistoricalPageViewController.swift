//
//  MainPageViewController.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 19/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class HistoricalPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
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

extension HistoricalPageViewController: HistoricalDelegate {
    func onHistoricalPress() {
        self.setViewControllers([pages[0]], direction: .reverse, animated: true)
    }
    
    func onReflectPress() {
        self.setViewControllers([pages[1]], direction: .forward, animated: true)
    }
}
