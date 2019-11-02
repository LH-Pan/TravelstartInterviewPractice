//
//  UIStoryboard+Extension.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/2.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

struct StoryboardCategory {
    
    static let lobby = "Lobby"
}

extension UIStoryboard {
    
    static var lobby: UIStoryboard { return setStoryboard(name: StoryboardCategory.lobby) }
    
    private static func setStoryboard(name: String) -> UIStoryboard {
        
        return UIStoryboard(name: name, bundle: nil)
    }
}
