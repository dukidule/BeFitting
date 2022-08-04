//
//  MenuTableDataSource.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == breakfastTableView {
            return breakfastFoodLogs.count
        }
        else if tableView == lunchTableView {
            return lunchFoodLogs.count
        }
        else if tableView == dinnerTableView {
            return dinnerFoodLogs.count
        }
        else if tableView == snacksTableView {
            return snacksFoodLogs.count
        } else {
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! FoodLogCell
        
        if tableView == breakfastTableView {
            cell.nameLabel.text = breakfastFoodLogs[indexPath.row].name
            cell.measurementLabel.text = breakfastFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = breakfastFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = breakfastFoodLogs[indexPath.row].calories + "cal"
            cell.proteinLabel.text =  breakfastFoodLogs[indexPath.row].protein + "p"
            cell.carbsLabel.text = breakfastFoodLogs[indexPath.row].carbs + "c"
            cell.fatsLabel.text = breakfastFoodLogs[indexPath.row].fats + "f"
            
        }
        if tableView == lunchTableView {
            cell.nameLabel.text = lunchFoodLogs[indexPath.row].name
            cell.measurementLabel.text = lunchFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = lunchFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = lunchFoodLogs[indexPath.row].calories + "cal"
            cell.proteinLabel.text = lunchFoodLogs[indexPath.row].protein + "p"
            cell.carbsLabel.text = lunchFoodLogs[indexPath.row].carbs + "c"
            cell.fatsLabel.text = lunchFoodLogs[indexPath.row].fats + "f"
            
        }
        if tableView == dinnerTableView {
            cell.nameLabel.text = dinnerFoodLogs[indexPath.row].name
            cell.measurementLabel.text = dinnerFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = dinnerFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = dinnerFoodLogs[indexPath.row].calories + "cal"
            cell.proteinLabel.text = dinnerFoodLogs[indexPath.row].protein + "p"
            cell.carbsLabel.text = dinnerFoodLogs[indexPath.row].carbs + "c"
            cell.fatsLabel.text = dinnerFoodLogs[indexPath.row].fats + "f"
            
        }
        if tableView == snacksTableView {
            cell.nameLabel.text = snacksFoodLogs[indexPath.row].name
            cell.measurementLabel.text = snacksFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = snacksFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = snacksFoodLogs[indexPath.row].calories + "cal"
            cell.proteinLabel.text = snacksFoodLogs[indexPath.row].protein + "p"
            cell.carbsLabel.text = snacksFoodLogs[indexPath.row].carbs + "c"
            cell.fatsLabel.text = snacksFoodLogs[indexPath.row].fats + "f"
            
        }
        print(indexPath)
        return cell
    }
    
}
