//
//  LoginManager.swift
//  LoginDemo
//
//  Created by Digices LLC on 3/16/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

protocol LoginManagerDelegate {
    func apiResponseReceived()
}

class LoginManager {

    var delegate : LoginManagerDelegate

    var data : LoginData = LoginData.shared

    init(delegate: LoginManagerDelegate) {
        self.delegate = delegate
    }

    func sendRequest() {

        if self.data.request.isValid == true {

            let session = URLSession.shared

            let task = session.dataTask(with: self.data.request.urlRequest(), completionHandler: {
                (data, response, error) -> Void in
    
                if let receivedData = data {
                    self.data.response.parse(data: receivedData)
                    if self.data.response.authenticated == true {
                        let am = AppDataManager.shared
                        am.data.loggedIn = true
                        am.save()
                    }
                    OperationQueue.main.addOperation {
                        self.delegate.apiResponseReceived()
                    }
                }
            })

            task.resume()

        }

    }

}
