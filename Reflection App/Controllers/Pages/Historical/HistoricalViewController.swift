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
    @IBOutlet weak var historicalCarousel: ScalingCarouselView!
    @IBOutlet weak var reflectionDate: UILabel!
    @IBOutlet weak var reflectionReward: UITextView!
    
    var reflections = Reflections()
    
    @IBAction func onFilter(_ sender: UIButton) {
    }
    
    @IBAction func onReflect(_ sender: UIButton) {
        historicalDelegate.onReflectPress()
    }
    
    override func viewDidLoad() {
        historicalCarousel.delegate = self
        historicalCarousel.dataSource = self
        
        historicalCarousel.backgroundColor = .none
        
        reflections = Reflection.shared.getReflections() ?? []
        
        reflections.forEach({ r in
            print(r.moodImage)
        })
        print(reflections.count)
        
        historicalCarousel.reloadData()
    }
}

extension HistoricalViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reflections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = historicalCarousel.dequeueReusableCell(withReuseIdentifier: "historicalCell", for: indexPath)
        
        if let historicalCell = cell as? HistoricalCell {
            historicalCell.historicalImage.image = UIImage(named: reflections[indexPath.item].moodImage ?? "")
            
            return historicalCell
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
