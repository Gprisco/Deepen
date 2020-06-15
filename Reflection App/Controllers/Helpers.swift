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
    func saveReflection(_ reflection: Reflection?)
}

protocol ReflectionDelegate {
    func clearFlow()
    func nextStep()
    func prevStep()
    func onMoodChoice(mood: String, moodImage: String)
    func onCategoryChoice(category: String, categoryImage: String)
    func onFirstAnswer(_ question: String, _ answer: String)
    func onSecondAnswer(_ question: String, _ answer: String)
    func onReflectionFinished()
}

func getViewController<T>(_ identifier: String) -> T {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifier) as! T
}

func getMediumItem(_ items: [Int]) -> Int {
    let max = items.max()
    let min = items.min()

    return (items[0] != min && items[0] != max) ? items[0] : ((items[1] != min && items[1] != max) ? items[1] : items[2])
}

extension Date {
    var text: String {
        let df = DateFormatter()
        df.dateFormat = "dd MMM YYYY"
        
        return df.string(from: self)
    }
}

func getImageNames(for initialName: String, frames: Int, loop: Bool) -> [UIImage] {
    var images = [UIImage]()
    
    for i in 1...frames {
        images.append(UIImage(named: "\(initialName)\(i)")!)
    }
    
    if loop {
        images.append(contentsOf: images.reversed())
    }
    
    return images
}
