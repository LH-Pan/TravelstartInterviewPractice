//
//  LobbyCollectionViewLayout.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/4.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class LobbyCollectionViewLayout: UICollectionViewFlowLayout {
    
    var itemCount: CGFloat = 0
    
    let inset: CGFloat = 16 / 375 * UIScreen.width
    
    override func prepare() {
        super.prepare()
        
        scrollDirection = .horizontal
        
        sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: minimumInteritemSpacing)
        
        itemSize = CGSize(width: ((collectionView?.frame.width ?? CGFloat.zero) - inset - minimumInteritemSpacing) / 2,
                          height: (collectionView?.frame.height ?? CGFloat.zero) - inset * 2)
    }
    
    override var collectionViewContentSize: CGSize {
        
        if collectionView == nil { return CGSize.zero }
        
        return CGSize(width: itemSize.width * itemCount + inset * 2 + minimumInteritemSpacing * (itemCount - 1),
                      height: collectionView?.bounds.height ?? CGFloat.zero)
    }
    
    override func shouldInvalidateLayout(
        forBoundsChange newBounds: CGRect
    ) -> Bool {
        
        return true
    }
}
