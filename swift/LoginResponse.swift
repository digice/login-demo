//
//  LoginResponse.swift
//  LoginDemo
//
//  Created by Digices LLC on 3/16/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class LoginResponse {
        
    var timestamp : Int = 0
    
    var authenticated : Bool = false
    
    var token : String = ""
    
    var message : String = ""
    
    func parse(data: Data) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:String]
        
        if let timestamp = json?["timestamp"] {
            self.timestamp = Int(timestamp)!
        }
        
        if let authenticated = json?["authenticated"] {
            if authenticated == "true" {
                self.authenticated = true
            }
        }
        
        if let token = json?["token"] {
            self.token = token
        }
        
        if let message = json?["message"] {
            self.message = message
        }
        
    }
    
    
}
