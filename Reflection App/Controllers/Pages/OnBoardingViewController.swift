//
//  OnBoardingViewController.swift
//  Reflection App
//
//  Created by Lorenzo on 10/06/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import paper_onboarding

class OnBoardingViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var onboarding: OnBoardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboarding.dataSource = self
        onboarding.delegate = self
        
        getStartedButton.layer.cornerRadius = 20
        getStartedButton.backgroundColor = UIColor(red: 0.57, green: 0.44, blue: 0.82, alpha: 1.00)
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 0.54, green: 0.42, blue: 0.77, alpha: 1.00)
        let backgroundColorTwo = UIColor(red: 0.49, green: 0.37, blue: 0.70, alpha: 1.00)
        let backgroundColorThree = UIColor(red: 0.44, green: 0.32, blue: 0.62, alpha: 1.00)
        let backgroundColorFour = UIColor(red: 0.38, green: 0.27, blue: 0.55, alpha: 1.00)
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)
        
        return [
            OnboardingItemInfo(informationImage: UIImage(named: "onboarding1")!, title: localizableString("Reflect"), description: localizableString("Reflecting helps you to know yourself better and to face life in a better way"), pageIcon: (UIImage(systemName: "smallcircle.fill.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal))!, color: backgroundColorOne, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage: UIImage(named: "onboarding2")!, title: localizableString("Improve yourself"), description: localizableString("Successful people practice reflection on a daily basis to be able to achieve their goals"), pageIcon: (UIImage(systemName: "smallcircle.fill.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal))!, color: backgroundColorTwo, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!),
           
            OnboardingItemInfo(informationImage: UIImage(named: "onboarding3")!, title: localizableString("Never stop wondering"), description: localizableString("Start the reflection by clicking on the feather and answer short questions about how the day went and how you feel"), pageIcon: (UIImage(systemName: "smallcircle.fill.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal))!, color: backgroundColorThree, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage: UIImage(named: "onboarding4")!, title: localizableString("Go Depeen"), description:  localizableString("At the end of each reflection you will receive advice on what you have written. Make it a habit!"), pageIcon: (UIImage(systemName: "smallcircle.fill.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal))!, color: backgroundColorFour, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!)
            ][index]
    }
    
    func onboardingItemsCount() -> Int {
        return 4
    }
    
    
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 || index == 2{
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2) {
                    self.getStartedButton.alpha = 0
                }
            }
            
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 3 {
            UIView.animate(withDuration: 0.4) {
                self.getStartedButton.alpha = 1
            }
        }
    }
    
    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        
        let userDefault = UserDefaults.standard
        userDefault.set(true, forKey: "onBoardingComplete")
        userDefault.synchronize()
        
        
        let vc = getViewController("historicalPageViewController") as HistoricalPageViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
        
    }
    
    
}
