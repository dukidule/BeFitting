//
//  BMIBrain.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 9/24/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import Foundation

struct BMIBrain {
    var bmi: Double = 0.0
    
    mutating func calculateBMI(weight: String, height: String) -> String {
        let weight2 = Double(weight)
        let height2 = Double(height)
        let bmi = weight2! / ((height2! / 100) * (height2! / 100))
        let formattedBmi = String(format: "%.2f", bmi)
        return formattedBmi
    }
}
