//
//  StoreFirebaseData.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import Firebase

struct StoreData {
    let db = Firestore.firestore()
    
    func storeFood(food: FoodLog) {
        if (Auth.auth().currentUser?.email) != nil {
            db.collection(K.Fstore.foodCollectionName).addDocument(data: [
                K.Fstore.foodNameField : food.name,
                K.Fstore.measurementField : food.measurement,
                K.Fstore.quantity : food.quantity,
                K.Fstore.calories : food.calories,
                K.Fstore.protein : food.protein,
                K.Fstore.carbs : food.carbs,
                K.Fstore.fats : food.fats,
                K.Fstore.counter : food.counter,
                K.Fstore.identifier: Auth.auth().currentUser?.email! as Any
                ])
            { (error) in
                if let e = error {
                    print("Issue saving data to firestore, \(e)")
                } else {
                    print("Successfully saved data!")
                }
            }
        }
    }
}
