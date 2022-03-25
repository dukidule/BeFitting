//
//  FoodLogs.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 3/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import Foundation

struct FoodLog {
    var name: String
//    let measurement: String
//    let quantity: String
    var calories: String
    var protein: String
    var carbs: String
    var fats: String

    
    init(name: String, calories: String, protein: String, carbs: String, fats: String) {
        self.name = name
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
        self.fats = fats
        
    }
}


