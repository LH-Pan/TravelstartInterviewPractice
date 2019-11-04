//
//  LobbyCollectionViewLayout.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/4.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class LobbyCollectionViewLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        scrollDirection = .horizontal
    }
}
