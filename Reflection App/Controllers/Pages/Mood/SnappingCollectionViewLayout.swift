//
//  gift.swift
//  WiredBrainCoffee
//
//  Created by Lorenzo on 16/05/2020.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class SnappingCollectionViewLayout: UICollectionViewFlowLayout {
    
    var previousOffset: CGFloat    = 0
    var currentPage: Int           = 0
    
    override func prepare() {
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        guard let collectionView = self.collectionView else {
            return CGPoint.zero
        }
        
        guard let itemsCount = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: 0) else {
            return CGPoint.zero
        }
        
        if ((previousOffset > collectionView.contentOffset.x) && (velocity.x < 0)) {
            currentPage = max(currentPage - 1, 0)
        } else if ((previousOffset < collectionView.contentOffset.x) && (velocity.x > 0.0)) {
            currentPage = min(currentPage + 1, itemsCount - 1);
        }

        let itemEdgeOffset:CGFloat = (collectionView.frame.width - itemSize.width -  minimumLineSpacing * 2) / 2
        let updatedOffset: CGFloat = (itemSize.width + minimumLineSpacing) * CGFloat(currentPage) - (itemEdgeOffset + minimumLineSpacing);
        
        previousOffset = updatedOffset;
        
        return CGPoint(x: updatedOffset, y: proposedContentOffset.y);
    }
    
}
