//
//  MoodViewController.swift
//  Reflection App
//
//  Created by Lorenzo on 15/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import ScalingCarousel

class MoodViewController: UIViewController {
    
    var reflectionDelegate: ReflectionDelegate!
    
    @IBOutlet weak var sectionTitle: UILabel!
    var sectionTitleString: String!
    
    @IBOutlet var backgroundImage: UIImageView!
    var backgroundImageName: String!
    
    var moodImages: [String]!
    var moods: [String]!
    var icons = [UIImage]()
    var type: String!
    
    @IBOutlet weak var scalingCarousel: ScalingCarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scalingCarousel.dataSource = self
        scalingCarousel.delegate = self
        
        scalingCarousel.backgroundColor = .none
        
        self.sectionTitle.text = sectionTitleString
        self.backgroundImage.image = UIImage(named: self.backgroundImageName)
        
        //        let width = scalingCarousel.bounds.width
        scalingCarousel.inset = self.view.bounds.width / 4
        
        moodImages.forEach({ moodImage in
            icons.append(UIImage(named: moodImage)!)
        })
        
        //        Add BubbleEmitter
        addBubblesAnimation(x: view.bounds.width, y: view.bounds.height, myView: self.view)
    }
    
    @IBAction func crossButtonPressed(_ sender: UIButton) {
        reflectionDelegate.clearFlow()
    }
}

extension MoodViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moodCell", for: indexPath)
        
        if let scalingCell = cell as? MoodCell {
            scalingCell.moodLabel.text = moods[indexPath.item]
            scalingCell.moodImage.image = icons[indexPath.item]
            
            DispatchQueue.main.async {
                cell.setNeedsLayout()
                cell.layoutIfNeeded()
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if type == "mood" {
            reflectionDelegate.onMoodChoice(mood: moods[indexPath.item], moodImage: moodImages[indexPath.item])
        } else if type == "category" {
            reflectionDelegate.onCategoryChoice(category: moods[indexPath.item], categoryImage: moodImages[indexPath.item])
        }
        reflectionDelegate.nextStep()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scalingCarousel.didScroll()
    }
}
