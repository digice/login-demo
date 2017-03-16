//
//  LoginData.swift
//  LoginDemo
//
//  Created by Digices LLC on 3/16/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class LoginData {
    
    static let shared = LoginData()
    
    var request = LoginRequest()
    
    var response = LoginResponse()
    
    // var response
    
    private init() {
        
    }
    
}
