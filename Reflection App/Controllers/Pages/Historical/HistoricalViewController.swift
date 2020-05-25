//
//  HistoricalViewController.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 20/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import ScalingCarousel

class HistoricalViewController: UIViewController {
    var historicalDelegate: HistoricalDelegate!
        
    @IBOutlet weak var reflectButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBAction func onFilter(_ sender: UIButton) {
    }
    
    @IBAction func onReflect(_ sender: UIButton) {
        historicalDelegate.onReflectPress()
    }
}
