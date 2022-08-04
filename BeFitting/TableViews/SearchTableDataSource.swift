//
//  SearchTableDataSource.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

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
