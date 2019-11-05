//
//  StringSeparator.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/5.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class StringSeparator {
    
    static func urlStrSeparate(string: String) -> [String] {
        
        let urlStringArray = string.components(separatedBy: "http")
        
        var attractionsImageURLArray: [String] = []
        
        for urlString in urlStringArray {
            
            if urlString.hasSuffix(".jpg") || urlString.hasSuffix(".JPG") || urlString.hasSuffix(".png") {
                
                attractionsImageURLArray.append("https" + urlString)
            }
        }
        
        return attractionsImageURLArray
    }
}
