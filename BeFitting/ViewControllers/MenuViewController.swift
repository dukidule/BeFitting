//
//  MenuViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 2/7/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var snacksLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var breakfastTableView: UITableView!
    @IBOutlet weak var lunchTableView: UITableView!
    @IBOutlet weak var dinnerTableView: UITableView!
    @IBOutlet weak var snacksTableView: UITableView!
    
    @IBOutlet weak var menuButton: UIButton!
    
    var foodLogs: [FoodLog] = [FoodLog(name: "Sarma", calories: 128, protein: 23, carbs: 22, fats: 38), FoodLog(name: "Pljeskavica", calories: 512, protein: 26, carbs: 35, fats: 67)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breakfastTableView.dataSource = self
        
//        lunchTableView.dataSource = self
//        dinnerTableView.dataSource = self
//        snacksTableView.dataSource = self
        
        
    }
    
    
}
//MARK: - Table View Code

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.foodCell, for: indexPath)
        cell.textLabel?.text = "This is a cell"
        return cell
    }
}
    

