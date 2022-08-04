//
//  GetFirebaseData.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import Firebase


class GetData {
    let db = Firestore.firestore()
    var foodsHistory: [FoodLog] = []
    var myFoods: [FoodLog] = []
    
    func getMyFoods() {
        if let currentUser = Auth.auth().currentUser?.email {
            myFoods = []
            db.collection(K.Fstore.foodCollectionName).getDocuments { (querySnapshot, error) in
                if let e = error {
                    print("There was an issue retrieving data from Firebase. \(e)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if currentUser == data[K.Fstore.identifier] as? String {
                            if let nameFoods = data[K.Fstore.foodNameField] as? String,
                                let measurementFoods = data[K.Fstore.measurementField] as? String,
                                let quantityFoods = data[K.Fstore.quantity] as? String,
                                let caloriesFoods = data[K.Fstore.calories] as? String,
                                let proteinFoods = data[K.Fstore.protein] as? String, let carbsFoods = data[K.Fstore.carbs] as? String, let fatsFoods = data[K.Fstore.fats] as? String {
                                let newFood = FoodLog(name: nameFoods, calories: caloriesFoods, measurement: measurementFoods, quantity: quantityFoods, protein: proteinFoods, carbs: carbsFoods, fats: fatsFoods, counter: 0)
                                
                                self.myFoods.append(newFood)
                            }
                        }
                    }
                }
            }
        }
    }
    func getFoods() {
        foodsHistory = []
        db.collection(K.Fstore.foodCollectionName).addSnapshotListener { (querySnapshot, error) in
            if let e = error {
                print("We were unable to retrieve the documents from Firebase \(e)")
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        let data = doc.data()
                        if let nameFoods = data[K.Fstore.foodNameField] as? String,
                            let measurementFoods = data[K.Fstore.measurementField] as? String,
                            let quantityFoods = data[K.Fstore.quantity] as? String,
                            let caloriesFoods = data[K.Fstore.calories] as? String,
                            let proteinFoods = data[K.Fstore.protein] as? String, let carbsFoods = data[K.Fstore.carbs] as? String, let fatsFoods = data[K.Fstore.fats] as? String {
                            let newFood = FoodLog(name: nameFoods, calories: caloriesFoods, measurement: measurementFoods, quantity: quantityFoods, protein: proteinFoods, carbs: carbsFoods, fats: fatsFoods, counter: 0)
                            
                            self.foodsHistory.append(newFood)
                            
                        }
                    }
                }
            }
            
        }
    }
}


