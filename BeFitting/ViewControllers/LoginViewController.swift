//
//  LoginViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 2/7/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var motivationalQuoteLabel: UILabel!
    @IBOutlet weak var loginEmailLabel: UILabel!
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordLabel: UILabel!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func login(_ sender: UIButton) {
        if let email = loginEmailTextField.text, let password = loginPasswordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    
                } else {
                    self.performSegue(withIdentifier: K.loginToMenu, sender: self)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
