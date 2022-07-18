//
//  Constants.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 2/8/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

struct K {
    
    static let appName = "BeFitting"
    static let toRegisterController = "goToRegister"
    static let toLoginViewController = "goToLogin"
    static let foodCell = "foodCell"
    static let registerToMenu = "registerToMenu"
    static let loginToMenu = "loginToMenu"
    static let cellID = "foodLogCell"
    static let cellNibName = "FoodLogCell"
    static let foodToMenu = "foodToMenu"
    
    //FirebaseFirestore
    struct Fstore {
    static let foodCollectionName = "foods"
    static let foodNameField = "foodName"
    static let measurementField = "measurement"
    static let quantity = "quantity"
    static let calories = "calories"
    static let protein = "protein"
    static let carbs = "carbs"
    static let fats = "fats"
        
    
        
        
    static let currentUser = "user"
    static let userCollectionName = "users"
    static let userDateDocument = "date"
    static let documentSubCollection = "loggedFoods"
}


}
