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
    @IBOutlet weak var measurementSelectionView: UIView!
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
    @IBOutlet weak var removeButton: UIButton!
    
    // UITableView
    @IBOutlet weak var measurementsTableView: UITableView!
    
    
    //Button Actions
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        if food.measurement == "" {
            food.measurement = "g"
        }
        
        food.name = nameTextField.text ?? ""
        food.quantity = quantityTextField.text ?? ""
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
        
        
        
        self.dismiss(animated: true, completion: nil)
        print(food)
    }
    
    @IBAction func removeButtonClicked(_ sender: UIButton) {
        passingFoodDelegate.removeFood(id: tableId)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showMeasurementChoices(_ sender: UIButton) {
        measurementSelectionView.isHidden = false
    }
    var measurements: [String] = [("g"), ("oz")]
    var passingFoodDelegate: PassingFood!
    var tableId = ""
    var food = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "")
   
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
  

//MARK: - Table View Code

extension FoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measurements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = measurements[indexPath.row]
        return cell
    }
}

//MARK: - Table View Delegate
extension FoodViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let measure = measurements[indexPath.row]
        food.measurement = measure
        measurementSelectionView.isHidden = true
        
    }
}
