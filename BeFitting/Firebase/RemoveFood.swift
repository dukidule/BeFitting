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
    
    func removeFood(date: String, id: String) {
        if let currentUser = Auth.auth().currentUser?.email {
            
            db.collection("users/\(currentUser)/date/\(currentDate)/\(id)").getDocuments() { (querySnapshot, error) in
                if let e = error {
                    print("There's an error.. \(e)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if let test = data["date"] as? String {
                            print(test)
                        if date == test  {
                           let identifier = "\(document.documentID)"
                            print("lalalala \(identifier)")
                            self.db.collection("users/\(currentUser)/date/\(self.currentDate)/\(id)").document("\(identifier)").delete()
                        }
                        }
                    }
                }
            }
        }
    }
}
