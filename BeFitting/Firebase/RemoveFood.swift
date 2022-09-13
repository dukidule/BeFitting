//
//  RemoveFood.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/12/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit
import Firebase

struct RemoveFood {
    let db = Firestore.firestore()
    var currentDate = "" 
    var id: String = ""
    
    func removeFood(food: FoodLog, date: String, id: String) {
        if let currentUser = Auth.auth().currentUser?.email {
            
            db.collection("users/\(currentUser)/date/\(currentDate)/\(id)").getDocuments() { (querySnapshot, error) in
                if let e = error {
                    print("There's an error.. \(e)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let identifier = "\(document.documentID)"
                        print("lalalala \(identifier)")
                        if let test = data["dateInSeconds"] as? Double {
                            if test == food.dateInSeconds {
                                self.db.collection("users/\(currentUser)/date/\(self.currentDate)/\(id)").document("\(identifier)").delete()
                            }
                        }
//                        if let test2 = data["date"] as? String {
//                            print(test2)
//                        if date == test2  {
//                           let identifier = "\(document.documentID)"
//                            print("lalalala \(identifier)")
//                            self.db.collection("users/\(currentUser)/date/\(self.currentDate)/\(id)").document("\(identifier)").delete()
//                        }
//                        }
                    }
                }
            }
        }
    }
}
