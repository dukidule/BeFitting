//
//  FoodCalculation.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import Foundation

struct FoodCalculation {
    var finishedFood: FoodLog = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)
    
    
    mutating func calculatefood (food: FoodLog, measurement: String, quantity: Int) -> FoodLog {
//        let finishedFood = (Int(food.calories) ?? 0) / (Int(food.quantity) ?? 0) * quantity
        var randomDouble: Double
        finishedFood.name = food.name
        finishedFood.measurement = food.measurement
        
        randomDouble =  (Double(food.calories)!) / (Double(food.quantity)!) * (Double(quantity))
        finishedFood.calories = String(format: "%.0f", randomDouble)
        
        randomDouble =  (Double(food.protein)!) / (Double(food.quantity)!) * (Double(quantity))
        finishedFood.protein = String(format: "%.2f", randomDouble)
        
        randomDouble = (Double(food.carbs)!) / (Double(food.quantity)!) * (Double(quantity))
        
        finishedFood.carbs = String(format: "%.2f", randomDouble)
        
        randomDouble = (Double(food.fats)!) / (Double(food.quantity)!) * (Double(quantity))
        finishedFood.fats = String(format: "%.2f", randomDouble)
        
        finishedFood.quantity = food.quantity
        
        return finishedFood
        
    }
}
