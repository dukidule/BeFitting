//
//  GetUser.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/10/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import Firebase

class GetUser {
    let db = Firestore.firestore()
    var currentDate: String = ""
    
    var breakfast: [FoodLog] = []
    var lunch: [FoodLog] = []
    var dinner: [FoodLog] = []
    var snacks: [FoodLog] = []
    
    func getUser(id: String) {
        if let currentUser = Auth.auth().currentUser?.email {
            breakfast = []
            lunch = []
            dinner = []
            snacks = []
            db.collection("users/\(currentUser)/date/\(currentDate)/\(id)").getDocuments { (querySnapshot, error) in
                if let e = error {
                    print("There is an error \(e)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                       if let nameFoods = data["name"] as? String,
                        let measurementFoods = data["measurement"] as? String,
                        let quantityFoods = data["quantity"] as? String,
                        let caloriesFoods = data["calories"] as? String,
                        let proteinFoods = data["protein"] as? String, let carbsFoods = data["carbs"] as? String, let fatsFoods = data["fats"] as? String, let currentDate = data["date"] as? String, let dateInSeconds = data["dateInSeconds"] as? Double {
                        let currentFood: FoodLog = FoodLog(name: nameFoods, calories: caloriesFoods, measurement: measurementFoods, quantity: quantityFoods, protein: proteinFoods, carbs: carbsFoods, fats: fatsFoods, counter: 0, date: currentDate, dateInSeconds: dateInSeconds)
                        print("OvdePucamHehe\(currentFood)")
                        if id == "breakfastTable" {
                            self.breakfast.append(currentFood)
                        } else if id == "lunchTable" {
                            self.lunch.append(currentFood)
                        } else if id == "dinnerTable" {
                            self.dinner.append(currentFood)
                        } else if id == "snacksTable" {
                            self.snacks.append(currentFood)
                        }
                        
                        
                    }
                }
            }
            
        }
        
    }
}
}
