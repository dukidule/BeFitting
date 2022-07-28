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
    @IBAction func addFoodButtonTapped(_ sender: UIButton) {
    }
    @IBAction func removeFoodButtonTapped(_ sender: UIButton) {
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
    
    
    var measurements: [String] = [("g"), ("Oz")]
    var food: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        measurementsTableView.delegate = self
        measurementsTableView.dataSource = self
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        measurementsSelectionView.isHidden = true
        
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
