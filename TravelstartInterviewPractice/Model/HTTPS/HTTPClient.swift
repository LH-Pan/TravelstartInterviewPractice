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
    
    private init() { }

    func fetchOpenData(offset: Int = 0, completion: @escaping (Result<Data>) -> Void) {
        
        var openDataUrl: URLComponents {
               
               var openDataUrl = URLComponents()
               
               openDataUrl.scheme = "https"
               
               openDataUrl.host = "data.taipei"
               
               openDataUrl.path = "/opendata/datalist/apiAccess"
               
               openDataUrl.queryItems = [
                   
                   URLQueryItem(name: "scope", value: "resourceAquire"),
                   
                   URLQueryItem(name: "rid", value: "36847f3f-deff-4183-a5bb-800737591de5"),
                   
                   URLQueryItem(name: "limit", value: "10"),
                   
                   URLQueryItem(name: "offset", value: String(offset))
               ]
               
               return openDataUrl
           }
        
        guard let url = openDataUrl.url else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard error == nil else {
                
                return completion(Result.failure(error!))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            let statusCode = httpResponse.statusCode
            
            switch statusCode {
                
            case 200..<300:
                
                completion(Result.success(data!))
            
            case 400..<500:
                
                completion(Result.failure(TIPHTTPClientError.clientError(data!)))
                
            case 500..<600:
                
                completion(Result.failure(TIPHTTPClientError.severError))
            
            default: return
                
                completion(Result.failure(TIPHTTPClientError.unexpectedError))
            }
            
        }.resume()
    }
}
