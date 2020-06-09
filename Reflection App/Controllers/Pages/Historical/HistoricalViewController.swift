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
    
    var reflections: Reflections!
    var selectedReflection = 0
    
    @IBAction func onFilter(_ sender: UIButton) {
    }
    
    @IBAction func onReflect(_ sender: UIButton) {
        historicalDelegate.onReflectPress()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        historicalCarousel.deviceRotated()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historicalCarousel.delegate = self
        historicalCarousel.dataSource = self
        
        historicalCarousel.backgroundColor = .none
        historicalCarousel.inset = self.view.bounds.width / 4
        
        if reflections.count > 0 {
            reflectionDate.text = "\(reflections[0].date!.text)"
            reflectionReward.text = reflections[0].reward ?? ""
        } else {
            reflectionDate.isHidden = true
            reflectionReward.isHidden = true
            historicalCarousel.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        historicalCarousel.inset = (UIScreen.main.bounds.width + 75) / 4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
            historicalCell.historicalImage.image = UIImage(named: reflections[indexPath.item].moodImage!)
            
            DispatchQueue.main.async {
                historicalCell.setNeedsLayout()
                historicalCell.layoutIfNeeded()
            }            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedReflection = indexPath.item
        performSegue(withIdentifier: "reflectionDetails", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reflectionDetails" {
            if let destinationVC = segue.destination as? ReflectionDetailsViewController {
                destinationVC.reflection = reflections[selectedReflection]
            }
        }
    }
}
