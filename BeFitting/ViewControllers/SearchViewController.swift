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
    func searchData() {
        if let searchText = searchBar?.searchTextField.text {
            searchedFoodsHistory = []
            let lettersCounter = searchText.count
            searchedFoodsHistory = foodsHistory.filter({ return $0.name.prefix(lettersCounter).caseInsensitiveCompare(searchText) == .orderedSame
            })
            historyTableView.reloadData()
            
        }
        else {
            
            searchedFoodsHistory = foodsHistory
            historyTableView.reloadData()
        }
    }
    
}

//MARK: UITableView

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.searchTextField.isEditing == true {
            counting = searchedFoodsHistory.count
            print("Prvi Slucaj.")
            return counting
        }
        else if searchBar.searchTextField.isEditing == false {
            counting = foodsHistory.count
            print("Drugi Slucaj.")
            return counting
        } else {
            counting = foodsHistory.count
            print("Treci Slucaj.")
            return counting
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! FoodLogCell
        
        if searchBar.searchTextField.isEditing == false {
            cell.nameLabel.text = foodsHistory[indexPath.row].name
            cell.caloriesLabel.text = foodsHistory[indexPath.row].calories + "cal"
            cell.measurementLabel.text = foodsHistory[indexPath.row].measurement
            cell.quantityLabel.text = foodsHistory[indexPath.row].quantity
            cell.proteinLabel.text = foodsHistory[indexPath.row].protein
            cell.carbsLabel.text = foodsHistory[indexPath.row].carbs
            cell.fatsLabel.text = foodsHistory[indexPath.row].fats
            
        }
            
        else {
            cell.nameLabel.text = searchedFoodsHistory[indexPath.row].name
            cell.caloriesLabel.text = searchedFoodsHistory[indexPath.row].calories + "cal"
            cell.measurementLabel.text = searchedFoodsHistory[indexPath.row].measurement
            cell.quantityLabel.text = searchedFoodsHistory[indexPath.row].quantity
            cell.proteinLabel.text = searchedFoodsHistory[indexPath.row].protein
            cell.carbsLabel.text = searchedFoodsHistory[indexPath.row].carbs
            cell.fatsLabel.text = searchedFoodsHistory[indexPath.row].fats
            
        }
        
        
        return cell
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBar.searchTextField.isEditing == false && searchedFoodsHistory.count > 0 {
        selectedFood.name = searchedFoodsHistory[indexPath.row].name
        selectedFood.calories = searchedFoodsHistory[indexPath.row].calories 
        selectedFood.measurement = searchedFoodsHistory[indexPath.row].measurement
        selectedFood.quantity = searchedFoodsHistory[indexPath.row].quantity
        selectedFood.protein = searchedFoodsHistory[indexPath.row].protein
        selectedFood.carbs = searchedFoodsHistory[indexPath.row].carbs
        selectedFood.fats = searchedFoodsHistory[indexPath.row].fats
        selectedFood.counter = searchedFoodsHistory[indexPath.row].counter


        print("Dusan nije car \(selectedFood)")
        let selectionVc = storyboard?.instantiateViewController(identifier: K.toAddedFoodId) as! AddedFoodViewController
        selectionVc.food = selectedFood
        selectionVc.tableId = tableId
        selectionVc.foodDelegate = passingFoodDelegate
        present(selectionVc, animated: true, completion: nil)
        }
        else {
            
            selectedFood.name = foodsHistory[indexPath.row].name
            selectedFood.calories = foodsHistory[indexPath.row].calories
            selectedFood.measurement = foodsHistory[indexPath.row].measurement
            selectedFood.quantity = foodsHistory[indexPath.row].quantity
            selectedFood.protein = foodsHistory[indexPath.row].protein
            selectedFood.carbs = foodsHistory[indexPath.row].carbs
            selectedFood.fats = foodsHistory[indexPath.row].fats
            selectedFood.counter = foodsHistory[indexPath.row].counter
            
            print("DusanJeCar \(selectedFood)")
            let selectionVc = storyboard?.instantiateViewController(identifier: K.toAddedFoodId) as! AddedFoodViewController
            selectionVc.food = selectedFood
            selectionVc.tableId = tableId
            selectionVc.foodDelegate = passingFoodDelegate
            present(selectionVc, animated: true, completion: nil)
            
        }
        
    }
}


//MARK: UISearchBar

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        myFoods = foodsHistory
        foodsHistory = []
        getFoods()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            self.searchData()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        if searchText.isEmpty == false {
        //            searchedFoodsHistory = []
        //            let lettersCounter = searchText.count
        //            searchedFoodsHistory = foodsHistory.filter({ return $0.name.prefix(lettersCounter).caseInsensitiveCompare(searchText) == .orderedSame
        //            })
        //            historyTableView.reloadData()
        //
        //        } else {
        //
        //            searchedFoodsHistory = foodsHistory
        //            historyTableView.reloadData()
        //        }
        searchData()
        
        
    }
}


