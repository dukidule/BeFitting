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
    
    @IBAction func allButtonPressed(_ sender: UIButton) {
        getFoods()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
                   self.searchData()
               }
        
        
    }
    @IBAction func myFoodsButtonPressed(_ sender: UIButton) {
        if let currentUser = Auth.auth().currentUser?.email {
            myFoods = []
            db.collection(K.Fstore.foodCollectionName).getDocuments { (querySnapshot, error) in
                if let e = error {
                    print("There was an issue retrieving data from Firebase. \(e)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if currentUser == data[K.Fstore.identifier] as? String {
                            if let nameFoods = data[K.Fstore.foodNameField] as? String,
                                let measurementFoods = data[K.Fstore.measurementField] as? String,
                                let quantityFoods = data[K.Fstore.quantity] as? String,
                                let caloriesFoods = data[K.Fstore.calories] as? String,
                                let proteinFoods = data[K.Fstore.protein] as? String, let carbsFoods = data[K.Fstore.carbs] as? String, let fatsFoods = data[K.Fstore.fats] as? String {
                                let newFood = FoodLog(name: nameFoods, calories: caloriesFoods, measurement: measurementFoods, quantity: quantityFoods, protein: proteinFoods, carbs: carbsFoods, fats: fatsFoods, counter: 0)
                                
                                self.myFoods.append(newFood)
                                self.historyTableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
            self.foodsHistory = self.myFoods
            self.searchData()
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var passingFoodDelegate: PassingFood!
    var tableId = ""
    var food: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)
    
    
    
    
    var foodsHistory: [FoodLog] = [FoodLog(name: "Braon sladoled", calories: "243", measurement: "g", quantity: "200", protein: "123", carbs: "255", fats: "243", counter: 0)]
    var searchedFoodsHistory: [FoodLog] = []
    let db = Firestore.firestore()
    var counting = 0
    var myFoods: [FoodLog] = []
    var selectedFood: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)
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
    
    
    func getFoods() {
        db.collection(K.Fstore.foodCollectionName).addSnapshotListener { (querySnapshot, error) in
            self.foodsHistory = []
            if let e = error {
                print("We were unable to retrieve the documents from Firebase \(e)")
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        let data = doc.data()
                        if let nameFoods = data[K.Fstore.foodNameField] as? String,
                            let measurementFoods = data[K.Fstore.measurementField] as? String,
                            let quantityFoods = data[K.Fstore.quantity] as? String,
                            let caloriesFoods = data[K.Fstore.calories] as? String,
                            let proteinFoods = data[K.Fstore.protein] as? String, let carbsFoods = data[K.Fstore.carbs] as? String, let fatsFoods = data[K.Fstore.fats] as? String {
                            let newFood = FoodLog(name: nameFoods, calories: caloriesFoods, measurement: measurementFoods, quantity: quantityFoods, protein: proteinFoods, carbs: carbsFoods, fats: fatsFoods, counter: 0)
                            
                            self.foodsHistory.append(newFood)
                            
                        }
                    }
                    DispatchQueue.main.async {
                        self.historyTableView.reloadData()
                    }
                }
            }
            
        }
    }
}


