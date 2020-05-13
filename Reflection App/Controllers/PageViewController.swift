//
//  PageViewController.swift
//  PageViewController
//
//  Created by Lorenzo on 12/05/2020.
//  Copyright © 2020 Lorenzo Masucci. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
   
//    Sorgente
    var arrayPagina = ["first","second","third","fourth","fifth"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Assegno DataSource
        self.dataSource = self
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: arrayPagina[0])
        self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
    
    }
    
//    ViewController Precedente
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = self.arrayPagina.firstIndex(of: viewController.restorationIdentifier!) else {
            return nil
        }
        let nextIndex = currentIndex - 1
        
        guard nextIndex >= 0 else {
            return nil
        }
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: arrayPagina[nextIndex])
       }
    
//       ViewController successivo
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = self.arrayPagina.firstIndex(of: viewController.restorationIdentifier!) else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        let maxPage = arrayPagina.count
        
        guard nextIndex != maxPage else {
            return nil
        }
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: arrayPagina[nextIndex])
       }

}
