//
//  LoginViewController.swift
//  LoginDemo
//
//  Created by Digices LLC on 3/16/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginManagerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner.stopAnimating()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func apiResponseReceived() {
        spinner.stopAnimating()
        self.messageLabel.text = LoginData.shared.response.message
        if LoginData.shared.response.authenticated == true {
            performSegue(withIdentifier: "showApp", sender: self)
        }
    }
    
    private func inputError(message: String) {
        spinner.stopAnimating()
        self.messageLabel.text = message
    }
    
    @IBAction func submitForm(_ sender: Any) {
        self.spinner.startAnimating()
        if let u = self.usernameField.text {
            if u.characters.count > 0 {
                if let p = self.passwordField.text {
                    if p.characters.count > 0 {
                        LoginData.shared.request.password = p
                        LoginData.shared.request.username = u
                        LoginData.shared.request.isValid = true
                        let lm = LoginManager(delegate: self)
                        lm.sendRequest()
                    } else {
                        self.inputError(message: "Please enter your password")
                    }
                }
            } else {
                self.inputError(message: "Username must not be blank")
            }
        }
    
    }

}
