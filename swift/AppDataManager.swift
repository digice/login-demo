//
//  AppDataManager.swift
//  LoginDemo
//
//  Created by Digices LLC on 3/16/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class AppDataManager {
    
    static let shared = AppDataManager()
    
    var data : AppData
    
    private init() {
        
        if let storedData = UserDefaults.standard.object(forKey: "appData") as? Data {
            self.data = (NSKeyedUnarchiver.unarchiveObject(with: storedData) as? AppData)!
        } else {
            self.data = AppData()
            self.save()
        }
    
    }
    
    func save() {
        
        let defaults = UserDefaults.standard
        let dataToSave = NSKeyedArchiver.archivedData(withRootObject: self.data)
        defaults.set(dataToSave, forKey: "appData")
        
    }
    
}
