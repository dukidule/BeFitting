//
//  AddedFoodTable.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

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
