//
//  RegisterViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 2/7/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import Firebase



class RegisterViewController: UIViewController {
    
    var email: String?
    var password: String?
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registrateButton: UIButton!
    @IBAction func registrateButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: K.registerToMenu, sender: self)
                }
            }
        }
    }
    @IBAction func enterEmailTextField(_ sender: UITextField) {
        if email != "" {
            email = emailTextField.text!
        } else {
            print("You haven't typed your email.")
        }
        
    }
    
    @IBAction func enterPasswordTextField(_ sender: UITextField) {
        if password != "" {
            password = passwordTextField.text!
        } else {
            print("You haven't typed your password.")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
