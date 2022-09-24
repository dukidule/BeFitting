//
//  BMIViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 9/24/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Foundation

class BMIViewController: UIViewController {
    //Views
    @IBOutlet weak var contentView: UIView!
    
    //Labels
    @IBOutlet weak var insertHeightLabel: UILabel!
    @IBOutlet weak var insertWeightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    //TextFields
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    //Buttons
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var height: Double?
    var weight: Double?
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if heightTextField.text != "" && weightTextField.text != "" {
            let bmiResult = bmi.calculateBMI(weight: weightTextField.text!, height: heightTextField.text!)
            bmiLabel.text = "Your current BMI is: \(bmiResult)"
            
        }
    }
    @IBAction func okButtonPressed(_ sender: Any) {
    }
    
    
    var bmi = BMIBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
