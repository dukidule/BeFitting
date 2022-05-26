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
    var measurement: String
    var quantity: String
    var calories: String
    var protein: String
    var carbs: String
    var fats: String

    
    init(name: String, calories: String, measurement: String, quantity: String, protein: String, carbs: String, fats: String) {
        self.name = name
        self.calories = calories
        self.measurement = measurement
        self.quantity = quantity
        self.protein = protein
        self.carbs = carbs
        self.fats = fats
    }
}


