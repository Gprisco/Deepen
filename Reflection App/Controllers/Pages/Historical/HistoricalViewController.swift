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
    
    var selectedItem: Int = 0
    
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
        
        reflections = (Reflection.shared.getReflections() ?? []).reversed()
        
        if reflections.count > 0 {
            reflectionDate.text = "\(reflections[0].date!.text)"
            reflectionReward.text = reflections[0].reward ?? ""
            
            historicalCarousel.inset = self.view.bounds.width / 4
            
            historicalCarousel.reloadData()
        } else {
            reflectionDate.isHidden = true
            reflectionReward.isHidden = true
            historicalCarousel.isHidden = true
        }
    }
}

extension HistoricalViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reflections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = historicalCarousel.dequeueReusableCell(withReuseIdentifier: "historicalCell", for: indexPath)
        
        if let historicalCell = cell as? HistoricalCell {
            historicalCell.historicalImage.image = UIImage(named: reflections[indexPath.item].moodImage!)
            
            DispatchQueue.main.async {
                historicalCell.setNeedsLayout()
                historicalCell.layoutIfNeeded()
            }
            
            return historicalCell
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCells = historicalCarousel.visibleCells
        var items = [Int]()
        
        for cell in visibleCells {
            items.append(historicalCarousel.indexPath(for: cell)!.item)
        }
        
        if items.count == 2 && items.min() == 0 {
            selectedItem = 0
        } else if items.count == 3 {
            selectedItem = getMediumItem(items)
        } else if items.count == 2 && items.max() == reflections.count-1 {
            selectedItem = reflections.count-1
        }
        
        self.reflectionDate.text = "\(reflections[selectedItem].date!.text)"
        self.reflectionReward.text = reflections[selectedItem].reward ?? ""
    }
}
