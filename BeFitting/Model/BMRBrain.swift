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
    mutating func calculateBmr(weight: Double, height: Double, age: Double, sex: String) -> Double {
        
        if sex == "man" {
            bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (4.330 * age)
        } else {
            if sex == "woman" {
                bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
            }
        }
       return bmr
    }
}
