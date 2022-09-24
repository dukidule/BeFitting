//
//  BMRBrain.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 9/24/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import Foundation

struct BmrBrain {
    var bmr: Double = 0.0
    
    
    mutating func calculateBmr(weight: String, height: String, age: String, sex: String) -> String {
        let weight2 = Double(weight)
        let height2 = Double(height)
        let age2 = Double(age)
        if sex == "man" {
            bmr = 88.362 + (13.397 * weight2!) + (4.799 * height2!) - (4.330 * age2!)
        } else {
            if sex == "woman" {
                bmr = 447.593 + (9.247 * weight2!) + (3.098 * height2!) - (4.330 * age2!)
            }
        }
        let formattedBmr = String(format: "%.0f", bmr)
       return formattedBmr
    }
}
