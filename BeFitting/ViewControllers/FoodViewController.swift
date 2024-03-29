//
//  FoodViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 3/21/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase


class FoodViewController: UIViewController {
    
    let db = Firestore.firestore()
    //ContentView
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var measurementSelectionView: UIView!
    //PopupView
    @IBOutlet weak var popUpView: UIView!
    
    //Labels
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var popUpLabel: UILabel!
    
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
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var okPopupButton: UIButton!
    // UITableView
    @IBOutlet weak var measurementsTableView: UITableView!
    
    
    var measurements: [String] = [("g"), ("Oz")]
    var passingFoodDelegate: PassingFood!
    var tableId = ""
    var food = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)
    var storingFood = StoreFoodData()
    var foodRemoval = RemoveFood()
    //Button Actions
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        if food.measurement == "" {
            food.measurement = "g"
        }
        if missingParameters() ==  true {
            food.name = nameTextField.text ?? ""
            food.quantity = quantityTextField.text ?? ""
            food.calories = caloriesTextField.text ?? ""
            food.protein = proteinTextField.text ?? ""
            food.carbs = carbsTextField.text ?? ""
            food.fats = fatsTextField.text ?? ""
            storingFood.storeFood(food: food)
            self.dismiss(animated: true, completion: nil)
        } else if missingParameters() == false {
            contentView.alpha = 0.5
            contentView.isUserInteractionEnabled = false
            popUpView.isHidden = false
        }
        print(food)
        print("eat dicc" + tableId)
    }
    @IBAction func okPopUpButtonTapped(_ sender: UIButton) {
        popUpView.isHidden = true
        contentView.isUserInteractionEnabled = true
        contentView.alpha = 1
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print(food)
    }
    
    @IBAction func removeButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showMeasurementChoices(_ sender: UIButton) {
        measurementSelectionView.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        measurementsTableView.dataSource = self
        measurementsTableView.delegate = self
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        nameTextField.text = food.name
        quantityTextField.text = food.quantity
        caloriesTextField.text = food.calories.replacingOccurrences(of: "cal", with: "")
        proteinTextField.text = food.protein
        carbsTextField.text = food.carbs
        fatsTextField.text = food.fats
        measurementSelectionView.isHidden = true
        quantitySelectionButton.setTitle("g", for: .normal)
        
        print(tableId)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        measurementsTableView.reloadData()
    }
    
    func nameMissing() -> Bool {
        if nameTextField.text == "" {
            return true
        } else {
            return false
        }
    }
    
    func quantityMissing() -> Bool {
        if quantityTextField.text == "" {
            return true
        } else {
            return false
        }
    }
    
    func caloriesMisisng() -> Bool {
        if caloriesTextField.text == "" {
            return true
        } else {
            return false
        }
    }
    
    func missingParameters() -> Bool {
        var a = 0
        if nameMissing() == true {
            a = a+1
        }
        if quantityMissing() == true {
            a = a+2
        }
        if caloriesMisisng() == true {
            a=a+5
        }
        switch a {
        case 0:
            return true
        case 1:
            popUpLabel.text = "Food name field is necessary"
            return false
        case 2:
            popUpLabel.text = "Food quantity field is necessary."
            return false
        case 3:
            popUpLabel.text = "Food name and quantity fields are necessary."
            return false
        case 5:
            popUpLabel.text = "Calories field is necessary."
            return false
        case 6:
            popUpLabel.text = "Food name and calories fields are necessary."
            return false
        case 7:
            popUpLabel.text = "Food quantity and calories fields are necessary"
            return false
        case 8:
            popUpLabel.text = "Food name, quantity and calories fields are necessary."
            return false
        default:
            print("You f'd up mate..")
            return false
        }
    }
}

