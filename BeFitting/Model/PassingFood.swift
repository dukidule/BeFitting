//
//  PassingFood.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

extension MenuViewController: PassingFood {
   
    func passFood(food: FoodLog, id: String) {
        var currentFood: FoodLog
        if id == "breakfastTable" {
            currentFood = breakfastFoodLogs[currentIndex!]
            if currentFood.name == "" {
                
                breakfastFoodLogs.insert(food, at: 0)
                breakfastTableView.reloadData()
            } else if currentFood.name != "" {
                breakfastFoodLogs[currentIndex!] = food
                breakfastTableView.reloadData()
            }
            
        } else if id == "lunchTable" {
            currentFood = lunchFoodLogs[currentIndex!]
            if currentFood.name == "" {
            lunchFoodLogs.insert(food, at: 0)
            lunchTableView.reloadData()
            }
            else if currentFood.name != "" {
                lunchFoodLogs[currentIndex!] = food
                breakfastTableView.reloadData()
            }
        } else if id == "dinnerTable" {
            currentFood = dinnerFoodLogs[currentIndex!]
            if currentFood.name == "" {
            dinnerFoodLogs.insert(food, at: 0)
            dinnerTableView.reloadData()
            }
            else if currentFood.name != "" {
                dinnerFoodLogs[currentIndex!] = food
                dinnerTableView.reloadData()
            }
        } else if id == "snacksTable" {
            currentFood = snacksFoodLogs[currentIndex!]
            if currentFood.name == "" {
            snacksFoodLogs.insert(food, at: 0)
            snacksTableView.reloadData()
            }
            else if currentFood.name != "" {
                snacksFoodLogs[currentIndex!] = food
                snacksTableView.reloadData()
            }
        }
    }
    
    func removeFood(id: String) {
        var food: FoodLog
        if currentIndex != nil {
            if id == "breakfastTable" && breakfastFoodLogs.count > 1 {
                food = breakfastFoodLogs[(breakfastFoodLogs.count)-1]
                if food.name != "" {
                breakfastFoodLogs.remove(at: currentIndex!)
                    breakfastFoodLogs.append(defaultFood)
                breakfastTableView.reloadData()
                } else if food.name == "" && currentIndex! != breakfastFoodLogs.count-1 {
                    breakfastFoodLogs.remove(at: currentIndex!)
                    breakfastTableView.reloadData()
                } else if food.name == "" && currentIndex! == breakfastFoodLogs.count-1{
                    breakfastFoodLogs.remove(at: currentIndex!)
                    breakfastFoodLogs.append(defaultFood)
                    breakfastTableView.reloadData()
                }
            } else if id == "breakfastTable" && breakfastFoodLogs.count == 1 {
                breakfastFoodLogs.remove(at: currentIndex!)
                breakfastFoodLogs.append(defaultFood)
                breakfastTableView.reloadData()
                
            } else if id == "lunchTable" && lunchFoodLogs.count > 1 {
                food = lunchFoodLogs[(lunchFoodLogs.count)-1]
                if food.name != "" {
                lunchFoodLogs.remove(at: currentIndex!)
                    lunchFoodLogs.append(defaultFood)
                lunchTableView.reloadData()
                } else if food.name == "" && currentIndex! != lunchFoodLogs.count-1 {
                    lunchFoodLogs.remove(at: currentIndex!)
                    lunchTableView.reloadData()
                } else if food.name == "" && currentIndex! == lunchFoodLogs.count-1{
                    lunchFoodLogs.remove(at: currentIndex!)
                    lunchFoodLogs.append(defaultFood)
                    lunchTableView.reloadData()
                }
            } else if id == "lunchTable" && lunchFoodLogs.count == 1 {
                lunchFoodLogs.remove(at: currentIndex!)
                lunchFoodLogs.append(defaultFood)
                lunchTableView.reloadData()
                
            } else if id == "dinnerTable" && dinnerFoodLogs.count > 1 {
                food = dinnerFoodLogs[(dinnerFoodLogs.count)-1]
                if food.name != "" {
                dinnerFoodLogs.remove(at: currentIndex!)
                    dinnerFoodLogs.append(defaultFood)
                dinnerTableView.reloadData()
                } else if food.name == "" && currentIndex! != dinnerFoodLogs.count-1 {
                    dinnerFoodLogs.remove(at: currentIndex!)
                    dinnerTableView.reloadData()
                } else if food.name == "" && currentIndex! == dinnerFoodLogs.count-1{
                    dinnerFoodLogs.remove(at: currentIndex!)
                    dinnerFoodLogs.append(defaultFood)
                    dinnerTableView.reloadData()
                }
            } else if id == "dinnerTable" && dinnerFoodLogs.count == 1 {
                dinnerFoodLogs.remove(at: currentIndex!)
                dinnerFoodLogs.append(defaultFood)
                dinnerTableView.reloadData()
                
            } else if id == "snacksTable" && snacksFoodLogs.count > 1 {
                food = snacksFoodLogs[(snacksFoodLogs.count)-1]
                if food.name != "" {
               snacksFoodLogs.remove(at: currentIndex!)
                    snacksFoodLogs.append(defaultFood)
                snacksTableView.reloadData()
                } else if food.name == "" && currentIndex! != snacksFoodLogs.count-1 {
                    snacksFoodLogs.remove(at: currentIndex!)
                    snacksTableView.reloadData()
                } else if food.name == "" && currentIndex! == snacksFoodLogs.count-1{
                    snacksFoodLogs.remove(at: currentIndex!)
                    snacksFoodLogs.append(defaultFood)
                    snacksTableView.reloadData()
                }
            } else if id == "snacksTable" && snacksFoodLogs.count == 1 {
                snacksFoodLogs.remove(at: currentIndex!)
                snacksFoodLogs.append(defaultFood)
                snacksTableView.reloadData()
            }
        }
    }
    
}
