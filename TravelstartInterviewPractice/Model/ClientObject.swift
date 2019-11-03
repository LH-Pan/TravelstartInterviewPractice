//
//  ClientObject.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/2.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import Foundation

struct ClientObject: Codable {
    
    let limit: Int
    
    let offset: Int
    
    let count: Int
    
    let sort: String
    
    let results: [Results]
}

struct Results: Codable {
    
    let info: String
    
    let stitle: String
    
    let xpostDate: String
    
    let longitude: String
    
    let refWp: String
    
    let avBegin: String
    
    let langinfo: String
    
    let mrt: String
    
    let serialNo: String
    
    let rowNumber: String
    
    let cat1: String
    
    let cat2: String
    
    let memoTime: String
    
    let poi: String
    
    let file: String
    
    let idpt: String
    
    let latitude: String
    
    let xbody: String
    
    let id: Int
    
    let avEnd: String
    
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case refWp = "REF_WP"
        case mrt = "MRT"
        case serialNo = "SERIAL_NO"
        case rowNumber = "RowNumber"
        case cat1 = "CAT1"
        case cat2 = "CAT2"
        case memoTime = "MEMO_TIME"
        case poi = "POI"
        case id = "_id"
        case info, stitle, xpostDate, longitude, avBegin, langinfo, file, idpt, latitude, xbody, avEnd, address
    }
}
