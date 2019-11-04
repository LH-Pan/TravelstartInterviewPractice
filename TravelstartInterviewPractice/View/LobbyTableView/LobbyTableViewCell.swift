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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
