//
//  LoginRequest.swift
//  LoginDemo
//
//  Created by Digices LLC on 3/16/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class LoginRequest {
    
    let url = URL(string: "https://www.digices.com/web-log-in/login.php")
    
    var username : String?
    
    var password : String?
    
    var isValid : Bool = false
    
    func urlRequest() -> URLRequest {
        
        var req = URLRequest(url: self.url!)
        
        if let u = self.username {
            if let p = self.password {
                req.httpMethod = "POST"
                req.httpBody = "u=\(u)&p=\(p)".data(using: .utf8)
            }
        }

        return req

    }
    
}
