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
    
    var moods = ["Felice", "Triste", "Arrabbiato", "Voglioso di Cazzo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .none
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.backgroundImage.image = UIImage(named: self.imageName)
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moods.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MoodViewCell
    
        // Configure the cell
        cell.moodImage.image = UIImage(named: "bubble")
        cell.moodLabel.text = moods[indexPath.row]
        
        cell.frame.size.width = collectionView.frame.size.width / 3
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
