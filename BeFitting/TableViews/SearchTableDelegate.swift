//
//  SearchTableDelegate.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

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
