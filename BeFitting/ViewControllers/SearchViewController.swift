//
//  File.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 7/17/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

protocol PassingFood {
    func passFood(food: FoodLog, id: String)
    func removeFood(id: String)
}

class SearchViewController: UIViewController  {
    
    // UIViews
    @IBOutlet weak var findFoodView: UIView!
    //Search Bar
    @IBOutlet weak var searchBar: UISearchBar!
    
    //TextFields&Labels
    @IBOutlet weak var historyLabel: UILabel!
    //UITableView
    @IBOutlet weak var historyTableView: UITableView!
    //UIButtonOutlets
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var myFoodsButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addFoodButton: UIButton!
    
    @IBAction func addFoodButtonTapped(_ sender: UIButton) {
        food.calories = food.calories + "cal" 
        let selectionVc = storyboard?.instantiateViewController(identifier: "foodViewController") as! FoodViewController
        present(selectionVc, animated: true, completion: nil)
    }
    
    var grabbingData = GetData()
    
    @IBAction func allButtonPressed(_ sender: UIButton) {
        grabbingData.getFoods()
        foodsHistory = grabbingData.foodsHistory
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
            self.searchData()
        }
        
        
    }
    @IBAction func myFoodsButtonPressed(_ sender: UIButton) {
        grabbingData.getMyFoods()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
            self.foodsHistory = self.grabbingData.myFoods
            self.searchData()
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var passingFoodDelegate: PassingFood!
    var tableId = ""
    var food: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)
    
    
    
    
    var foodsHistory: [FoodLog] = [FoodLog(name: "Braon sladoled", calories: "243", measurement: "g", quantity: "200", protein: "123", carbs: "255", fats: "243", counter: 0, date: "", dateInSeconds: 0)]
    var searchedFoodsHistory: [FoodLog] = []
    let db = Firestore.firestore()
    var counting = 0
    var myFoods: [FoodLog] = []
    var selectedFood: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)
    //    var lettersCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        getFoods()
        searchBar.delegate = self
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellID)
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        historyTableView.reloadData()
        print("lenor\(counting)")
    }
    
    func countFoods() {
        var documentArray: [String] = []
        db.collection(K.Fstore.foodCollectionName).getDocuments() { (querySnapshot, err)  in
            if let e = err {
                print("There was an issue retrieving data from firestore \(e)")
                
            } else {
                for document in querySnapshot!.documents {
                    let bla = "\(document.documentID)"
                    documentArray.append(bla)
                    
                    print(documentArray.count)
                }
            }
            let numberOfElements = documentArray.count
            self.counting = numberOfElements
            print("OVAJ \(self.counting)")
            print("ovaj \(documentArray)")
        }
        
    }
}

