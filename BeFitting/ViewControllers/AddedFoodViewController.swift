//
//  AddedFoodViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 7/27/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Foundation

class AddedFoodViewController: UIViewController {
    
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var measurementsSelectionView: UIView!
    @IBOutlet weak var popUpView: UIView!
    
    // Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var popUpLabel: UILabel!
    // Text Fields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet weak var proteinTextField: UITextField!
    @IBOutlet weak var carbsTextField: UITextField!
    @IBOutlet weak var fatsTextFIeld: UITextField!
    //Buttons
    @IBOutlet weak var quantitySelectionButton: UIButton!
    @IBOutlet weak var addFoodButton: UIButton!
    @IBOutlet weak var removeFoodButton: UIButton!
    @IBOutlet weak var cancelFoodButton: UIButton!
    
    @IBOutlet weak var okPopUpButton: UIButton!
    @IBOutlet weak var measurementsTableView: UITableView!
    //UITabeView
    //ButtonActions
    @IBAction func okButtonPressed(_ sender: UIButton) {
        popUpView.isHidden = true
    }
    
    var tableId = ""
    var foodDelegate: PassingFood!
    var measurements: [String] = [("g"), ("Oz")]
    var food: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)
    var foodCalculator = FoodCalculation()
    var otherFood: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)
    var storeUser = StoreUser()
    var removeFood = RemoveFood()
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        let userInput = (Int(quantityTextField.text ?? "Prop'o") ) ?? 0
        otherFood = foodCalculator.calculatefood(food: food, measurement: food.measurement, quantity: userInput)
        caloriesTextField.text = otherFood.calories + "cal"
        proteinTextField.text = otherFood.protein
        fatsTextFIeld.text = otherFood.fats
        carbsTextField.text = otherFood.carbs
        otherFood.date = food.date
        
        print("5555 \(otherFood), \(userInput)")
    }
    
    
    
    @IBAction func addFoodButtonTapped(_ sender: UIButton) {
       print("Ovde pucam \(food)")
        popUpView.isHidden = false
        print(tableId)
        if quantityTextField.text == "" {
            popUpView.isHidden = false
            popUpLabel.text = "Please fill out the quantity field to proceed."
        } else if quantityTextField.text!.count > 0 {
        food = otherFood
        let currentTime = Date().timeIntervalSinceReferenceDate
        food.dateInSeconds = currentTime
        food.quantity = quantityTextField.text ?? ""
        storeUser.storeUser(food: food, id: tableId, currentDate: food.date)
        foodDelegate.passFood(food: food, id: tableId)
        performSegue(withIdentifier: "toMenuVc", sender: self)
        }
        
    }
    @IBAction func removeFoodButtonTapped(_ sender: UIButton) {
        print("dama salama ")
        removeFood.removeFood(food: food, date: removeFood.currentDate, id: tableId)
        foodDelegate.removeFood(id: tableId)
        performSegue(withIdentifier: "toMenuVc", sender: self)
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func showMeasurementsChoices(_ sender: UIButton) {
        if measurementsSelectionView.isHidden == false {
            measurementsSelectionView.isHidden = true
        } else {
            measurementsSelectionView.isHidden = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        measurementsTableView.delegate = self
        measurementsTableView.dataSource = self
         IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        measurementsSelectionView.isHidden = true
        popUpView.isHidden = true
        if food.measurement == "" {
                   food.measurement = "g"
               }
               nameTextField.text = food.name
               
               caloriesTextField.text = food.calories
               proteinTextField.text = food.protein
               carbsTextField.text = food.carbs
               fatsTextFIeld.text = food.fats
        
        quantitySelectionButton.setTitle("g", for: .normal
        )
        print("salamica damica \(food.date)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        measurementsTableView.reloadData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != measurementsSelectionView {
            measurementsSelectionView.isHidden = true
        }

    }
    
    
    
}
