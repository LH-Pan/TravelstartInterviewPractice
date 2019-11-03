//
//  InformationProvider.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/3.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import Foundation

typealias InfoHandler = (Result<[ClientObject]>) -> Void

class InformationProvider {
    
    let decoder = JSONDecoder()
    
    func fetchInformation(completion: @escaping InfoHandler) {
        
        HTTPClient.shared.fetchOpenData(
            completion: { [weak self] result in
            
                guard let strongSelf = self else { return }
                
                switch result {
                
                case .success(let data):
                    
                    do {
                        let response = try strongSelf.decoder.decode(TIPSuccessParser<[ClientObject]>.self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            completion(Result.success(response.data))
                        }
                        
                    } catch {
                        
                        completion(Result.failure(error))
                    }
                    
                case .failure(let error):
                    
                    completion(Result.failure(error))
                }
        })
    }
}
