//
//  MoodViewController.swift
//  Reflection App
//
//  Created by Lorenzo on 15/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

private let reuseIdentifier = "moodCell"

class MoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageName: String!
    
    var moods = ["Felice", "Triste", "Arrabbiato", "Voglioso di Cazzo","Felice", "Triste", "Arrabbiato", "Voglioso di Cazzo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .none
        self.backgroundImage.image = UIImage(named: self.imageName)
        
        
        
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MoodViewCell {
            
            // Configure the cell
            cell.moodImage.image = UIImage(named: "Bollicine1")
            cell.moodLabel.text = self.moods[indexPath.item]
            
            //            if indexPath.item == 1 {
            //              cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            //            }
            
            return cell
        }
        
        return MoodViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidth = collectionView.bounds.width
        
        let width: CGFloat = collectionWidth / 3
        let height: CGFloat = collectionWidth / 2
        return CGSize(width: width, height: height)
    }
}

extension MoodViewController : UIScrollViewDelegate {
    
//    MARK: MUNNEZZA
    /*
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            //              if let row = collectionView.indexPath(for: cell)?.item {
            //                   print(row)
            //              }
            let myIndex = collectionView.indexPath(for: cell)
            let myItem = collectionView.selectItem(at: myIndex, animated: true, scrollPosition: [])
            print(myItem)
            
        }
        
//        for index in collectionView.indexPathsForVisibleItems {
//            print(index.item)
//        }
     
    }
 */
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // center X of collection View
        let centerX = self.collectionView.center.x
        
        // only perform the scaling on cells that are visible on screen
        for cell in self.collectionView.visibleCells {
            
            // coordinate of the cell in the viewcontroller's root view coordinate space
            let basePosition = cell.convert(CGPoint.zero, to: self.view)
            let cellCenterX = basePosition.x + self.collectionView.frame.size.height / 2.0
            
            let distance = abs(cellCenterX - centerX)
            
            let tolerance : CGFloat = 0.02
            var scale = 1.00 + tolerance - (( distance / centerX ) * 0.17)
            if(scale > 1.0) {
                scale = 1.0
            }
            
            if(scale < 0.80) {
                scale = 0.80
            }
            
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}
