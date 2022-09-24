//
//  BMRViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 9/24/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Foundation

class BmrViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    //Labels
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var bmrLabel: UILabel!
    
    //UITextFields
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    //Buttons
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    //ButtonActions
    @IBAction func maleButtonPressed(_ sender: UIButton) {
        sexChoice = "man"
        if maleButton.isSelected == false {
            maleButton.isSelected = true
            femaleButton.isSelected = false
        } else {
            maleButton.isSelected = false
        }
    }
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        sexChoice = "woman"
        if femaleButton.isSelected == false {
            femaleButton.isSelected = true
            maleButton.isSelected = false
        } else {
            maleButton.isSelected = false
        }
    }
    var sexChoice = ""
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if heightTextField.text != "" && ageTextField.text != "" && weightTextField.text != "" && sexChoice != "" {
            let currentBmr = bmrCalculator.calculateBmr(weight: weightTextField.text!, height: heightTextField.text!, age: ageTextField.text!, sex: sexChoice)
            bmrLabel.text = "Your current BMR is: \(currentBmr)"
        } else {
            bmrLabel.text = "All fields must be filled and gender selected."
        }
    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    var bmrCalculator = BmrBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maleButton.layer.cornerRadius = maleButton.frame.height * 0.4
        maleButton.layer.masksToBounds = true
        
        femaleButton.layer.cornerRadius = femaleButton.frame.height * 0.4
        femaleButton.layer.masksToBounds = true
    }
}
