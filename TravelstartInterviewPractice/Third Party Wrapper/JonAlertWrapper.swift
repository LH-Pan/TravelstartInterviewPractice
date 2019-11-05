//
//  JonAlertWrapper.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/3.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import JonAlert

enum AlertType {
    
    case success(String)
    
    case failure(String)
}

class TIPJonAlert {
    
    static func show(type: AlertType) {
        
        switch type {
            
        case .success(let message):
            
            showSuccess(message: message)
            
        case .failure(let message):
            
            showError(message: message)
        }
    }
        
    static func showSuccess(message: String = "success") {
        
        if !Thread.isMainThread {
            
            DispatchQueue.main.async {
                
                showSuccess(message: message)
            }
            
            return
        }
        
        JonAlert.showSuccess(message: message)
    }
    
    static func showError(message: String = "Failure") {
        
        if !Thread.isMainThread {
            
            DispatchQueue.main.async {
                
                showError(message: message)
            }
            
            return
        }
        
        JonAlert.showError(message: message)
    }
    
    static func showMessage(message: String) {
        
        if !Thread.isMainThread {
            
            DispatchQueue.main.async {
                
                showMessage(message: message)
            }
            
            return
        }
        
        JonAlert.show(message: message)
    }
    
    static func showCustomIcon(message: String, icon image: UIImage?) {
        
        if !Thread.isMainThread {
            
            DispatchQueue.main.async {
                
                showCustomIcon(message: message, icon: image)
            }
            
            return
        }
        
        JonAlert.show(message: message, andIcon: image)
    }
}
