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

class SearchViewController: UIViewController {
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
    @IBAction func allButtonPressed(_ sender: UIButton) {
        
        
    }
    @IBAction func myFoodsButtonPressed(_ sender: UIButton) {
        print(counting)
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    var foodsHistory: [FoodLog] = []
    
    
    let db = Firestore.firestore()
    var usedFood: [String] = [""]
    var counting = 0
    var foodsFromBase: [FoodLog] = [FoodLog(name: "sarma", calories: "123", measurement: "g", quantity: "123", protein: "23", carbs: "97", fats: "58", counter: 0)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.delegate = self
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellID)
        
        countFoods()
        print("Bre \(counting)")
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        historyTableView.reloadData()
        print("lenor\(counting)")
    }
    
    func searchFoodInHistory(current: String, existing: String) {
        
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
    }
}

//MARK: UITableView

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsHistory.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! FoodLogCell
        
        cell.nameLabel.text = foodsHistory[indexPath.row].name
        cell.caloriesLabel.text = foodsHistory[indexPath.row].calories + "cal"
        cell.measurementLabel.text = foodsHistory[indexPath.row].measurement
        cell.quantityLabel.text = foodsHistory[indexPath.row].quantity
        
        
        
        return cell
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


//MARK: UISearchBar

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty == false {
            foodsHistory = foodsFromBase.filter { return $0.name.range(of: searchText, options: .caseInsensitive) != nil
            }
            historyTableView.reloadData()
        }
        
    }
}


