//
//  Helpers.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 19/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

protocol HistoricalDelegate {
    func onHistoricalPress()
    func onReflectPress()
}

protocol ReflectionDelegate {
    func nextStep()
    func prevStep()
    func onMoodChoice(mood: String, moodImage: String)
    func onFirstAnswer(_ answer: String)
    func onSecondAnswer(_ answer: String)
    func onReflectionFinished()
}

func getViewController<T>(_ identifier: String) -> T {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifier) as! T
}
