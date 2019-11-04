//
//  KingFisherWrapper.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/4.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    func loadImage(_ urlString: String?, placeHolder: UIImage? = nil) {

        guard urlString != nil else { return }
        
        let url = URL(string: urlString!)

        self.kf.setImage(with: url, placeholder: placeHolder)
    }
}
