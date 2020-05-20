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
    
    @IBOutlet weak var scalingCarousel: ScalingCarouselView!
    
    @IBOutlet weak var reflectButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBAction func onFilter(_ sender: UIButton) {
    }
    
    @IBAction func onReflect(_ sender: UIButton) {
        historicalDelegate.onReflectPress()
    }
    
    override func viewDidLoad() {
        scalingCarousel.delegate = self
        scalingCarousel.dataSource = self
    }
}

extension HistoricalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historicalCell", for: indexPath)
        
        if let scalingCell = cell as? HistoricalCell {
            
        }
        
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scalingCarousel.didScroll()
    }
}
