//
//  UITableView+Extension.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/2.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit
import ESPullToRefresh

extension UITableView {
    
    func custom_registerCellWithNib(identifier: String, bundle: Bundle?) {
        
        let nib = UINib(nibName: identifier, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: identifier)
    }
    
    func custom_registerHeaderWithNib(identifier: String, bundle: Bundle?) {
        
        let nib = UINib(nibName: identifier, bundle: bundle)
        
        register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
}

extension UITableViewCell {
    
    static var identifier: String {
        
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    
    static var identifier: String {
        
        return String(describing: self)
    }
}
