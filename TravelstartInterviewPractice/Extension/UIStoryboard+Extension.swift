//
//  UIStoryboard+Extension.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/2.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

struct StoryboardCategory {
    
    static let main = "Main"
    
    static let detailScreen = "DetailScreen"
}

extension UIStoryboard {
    
    static var main: UIStoryboard { return setStoryboard(name: StoryboardCategory.main) }
    
    static var detailScreen: UIStoryboard { return setStoryboard(name: StoryboardCategory.detailScreen) }
    
    private static func setStoryboard(name: String) -> UIStoryboard {
        
        return UIStoryboard(name: name, bundle: nil)
    }
}
