//
//  FoodViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 3/21/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
   //ContentView
    @IBOutlet weak var contentView: UIView!
    //Labels
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    //TextFields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet weak var proteinTextField: UITextField!
    @IBOutlet weak var carbsTextField: UITextField!
    @IBOutlet weak var fatsTextField: UITextField!
    //Buttons
    @IBOutlet weak var quantitySelectionButton: UIButton!
    @IBAction func displayTableView(_ sender: UIButton) {
        print(quantitySelectionButton.frame.size.width)
        print(quantitySelectionButton.frame.size.height)
        print(nameTextField.frame.size.height
        )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        quantitySelectionButton.frame.size.width = 10
        quantitySelectionButton.frame.size.height = 10
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        quantitySelectionButton.frame.size.width = 10
        quantitySelectionButton.frame.size.height = 10
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    var food: FoodLog?
    
}
