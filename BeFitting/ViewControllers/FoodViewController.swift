//
//  FoodViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 3/21/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

protocol PassingFood {
    func passFood(food: FoodLog, id: String)
    func removeFood(id: String)
}
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
        food.quantity = quantityTextField.text ?? ""
        food.measurement = "g"
        food.calories = (caloriesTextField.text ?? "") + "cal"
        food.protein = proteinTextField.text ?? ""
        food.carbs = carbsTextField.text ?? ""
        food.fats = fatsTextField.text ?? ""
        passingFoodDelegate.passFood(food: food, id: tableId)
        self.dismiss(animated: true, completion: nil)
        print(food)
        print("eat dicc" + tableId)
    }
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        passingFoodDelegate.removeFood(id: tableId)
        
        
        self.dismiss(animated: true, completion: nil)
        print(food)
    }
    
    @IBAction func showMeasurementChoices(_ sender: UIButton) {	
    }
    
    var passingFoodDelegate: PassingFood!
    var tableId = ""
    var food = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        print(tableId)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "\(K.foodToMenu)" {
//                let destinationVc = segue.destination as! MenuViewController
//            if destinationVc.cellIDForTable == "breakfastFoodLogID" {
//                destinationVc.breakfastFoodLogs.insert(food, at: 0)
//            }
//            }
//        }
    }
    

