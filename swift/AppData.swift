//
//  AppData.swift
//  LoginDemo
//
//  Created by Digices LLC on 3/16/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class AppData : NSObject, NSCoding {

    var loggedIn : Bool

    override init() {
        self.loggedIn = false
    }

    required init?(coder aDecoder: NSCoder) {
        self.loggedIn = aDecoder.decodeBool(forKey: "loggedIn")
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.loggedIn, forKey: "loggedIn")
    }

}
