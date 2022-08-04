//
//  AddedFoodViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 7/27/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class AddedFoodViewController: UIViewController {
    
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var measurementsSelectionView: UIView!
    
    // Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
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
    //UITabeView
    @IBOutlet weak var measurementsTableView: UITableView!
    //ButtonActions
   
    var tableId = ""
    var foodDelegate: PassingFood!
    var measurements: [String] = [("g"), ("Oz")]
    var food: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)
    var foodCalculator: FoodCalculation = FoodCalculation()
    var otherFood: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        let userInput = (Int(quantityTextField.text ?? "Prop'o") ) ?? 0
        otherFood = foodCalculator.calculatefood(food: food, measurement: food.measurement, quantity: userInput)
        
        caloriesTextField.text = otherFood.calories + "cal"
        proteinTextField.text = otherFood.protein
        fatsTextFIeld.text = otherFood.fats
        carbsTextField.text = otherFood.carbs
        
        print("5555 \(otherFood), \(userInput)")
    }
    
    
    @IBAction func addFoodButtonTapped(_ sender: UIButton) {
       print("Ovde pucam \(food)")
        print(tableId)
        food = otherFood
        
//        foodCalculator?.calculatefood(food: food, measurement: food.measurement, quantity:)
        food.quantity = quantityTextField.text ?? ""
        print(food)
        
        foodDelegate.passFood(food: food, id: tableId)
        performSegue(withIdentifier: "toMenuVc", sender: self)
        
    }
    @IBAction func removeFoodButtonTapped(_ sender: UIButton) {
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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        measurementsTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != measurementsSelectionView {
            measurementsSelectionView.isHidden = true
        }

    }
    
}
//MARK: UITableView
extension AddedFoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measurements.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = measurements[indexPath.row]
        
        return cell
    }
}
    


extension AddedFoodViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let measure = measurements[indexPath.row]
//        food.measurement = measure
        measurementsSelectionView.isHidden = true
        if quantitySelectionButton.titleLabel?.text != measure {
           
            quantitySelectionButton.setTitle(measure, for: .normal)
        }
    }
}
