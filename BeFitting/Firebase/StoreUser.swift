//
//  StoreUser.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/10/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import Firebase

struct StoreUser {
    let db = Firestore.firestore()
   
    var currentDate: String {
        let myTime = Date()
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy."
        return formater.string(from: myTime)
    }
    
    mutating func storeUser(food: FoodLog, id: String) {
        if (Auth.auth().currentUser?.email != nil) {
            let user = (Auth.auth().currentUser?.email!)!
            
            
            db.collection("users").document(user).setData(["id" : user])
            
            db.collection("users").document(user)
                .collection("date").document("\(currentDate)").setData(["date" : Date()])
            db.collection("users").document(user).collection("date").document("\(currentDate)").collection("\(id)").addDocument(data: [
                "name" : food.name,
                "calories" : food.calories,
                "measurement" : food.measurement,
                "protein" : food.protein,
                "carbs" : food.carbs,
                "fats" : food.fats,
                "quantity" : food.quantity,
                "identifier" : user
            ])
            
            
        }
        
    }
    
    
    //if (Auth.auth().currentUser?.email) != nil {
    //    db.collection(K.Fstore.foodCollectionName).addDocument(data: [
    //        K.Fstore.foodNameField : food.name,
    //        K.Fstore.measurementField : food.measurement,
    //        K.Fstore.quantity : food.quantity,
    //        K.Fstore.calories : food.calories,
    //        K.Fstore.protein : food.protein,
    //        K.Fstore.carbs : food.carbs,
    //        K.Fstore.fats : food.fats,
    //        K.Fstore.counter : food.counter,
    //        K.Fstore.identifier: Auth.auth().currentUser?.email! as Any
    //        ])
    //    { (error) in
    //        if let e = error {
    //            print("Issue saving data to firestore, \(e)")
    //        } else {
    //            print("Successfully saved data!")
    //        }
    
}
