//
//  OnboardingViewController.swift
//  Reflection App
//
//  Created by Vincenzo Paparo on 10/06/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var holder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    private func configure() {
        let scrollView = UIScrollView(frame: holder.bounds)
        holder.addSubview(scrollView)
        
        for numb in 0..<4 {
            let pageView = UIView (frame: CGRect(x: CGFloat(numb) * (holder.frame.size.width) , y: 0, width: holder.frame.size.width, height: holder.frame.size.height))
            scrollView.addSubview(pageView)
//            title, image, button
            
        }
        
    }
}
