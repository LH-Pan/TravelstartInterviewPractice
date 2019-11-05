//
//  TIPParser.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/3.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import Foundation

struct TIPSuccessParser<T: Codable>: Codable {
    
    let result: T
}

struct TIPFailureParser: Codable {
    
    let errorMassage: String
}
