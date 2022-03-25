//
//  FoodViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 3/21/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

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
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //Button Actions
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        food.name = nameTextField.text ?? ""
        food.calories = caloriesTextField.text ?? ""
        food.protein = proteinTextField.text ?? ""
        food.carbs = carbsTextField.text ?? ""
        food.fats = fatsTextField.text ?? ""
        performSegue(withIdentifier: ("\(K.foodToMenu)"), sender: self)
        print(food)
    }
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print(food)
    }
    @IBAction func displayTableView(_ sender: UIButton) {
        
    }
    var food = FoodLog(name: "", calories: "", protein: "", carbs: "", fats: "")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "\(K.foodToMenu)" {
                let destinationVc = segue.destination as! MenuViewController
            if destinationVc.cellIDForTable == "breakfastFoodLogID" {
                destinationVc.breakfastFoodLogs.append(food)
            }
            }
        }
    }
    

