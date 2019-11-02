//
//  HTTPClient.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/2.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(T)
    
    case failure(Error)
}

enum TIPHTTPClientError: Error {
    
    case decodeDataFail
    
    case clientError(Data)
    
    case severError
    
    case unexpectedError
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private let decoder = JSONDecoder()
    
    private init() { }
    
    func request() {
        
    }
}


