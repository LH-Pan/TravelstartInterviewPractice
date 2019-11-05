//
//  DetailScreenTableViewCell.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/5.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class DetailScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
