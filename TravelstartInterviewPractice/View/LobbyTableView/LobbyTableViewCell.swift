//
//  LobbyTableViewCell.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/2.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class LobbyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    lazy var lobbyCollectionViewLayout: LobbyCollectionViewLayout = {
        
        let layoutObject = LobbyCollectionViewLayout()
        
        layoutObject.itemCount = CGFloat(attractionsImageURLArray.count)
        
        return layoutObject
    }()
    
    var attractionsImageURLArray: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func registerCollectionView() {
        
        imageCollectionView.custom_registerCellWithNib(
            identifier: LobbyCollectionViewCell.identifier,
            bundle: nil
        )
        
        imageCollectionView.collectionViewLayout = lobbyCollectionViewLayout
    }
}
