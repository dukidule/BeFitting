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
    
    var foodLogs: [FoodLog] = [
        FoodLog(name: "Sarma", calories: 128, protein: 23, carbs: 22, fats: 38),
        FoodLog(name: "Pljeskavica", calories: 512, protein: 26, carbs: 35, fats: 67)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breakfastTableView.delegate = self
        breakfastTableView.dataSource = self
        menuButton.layer.cornerRadius = menuButton.frame.height * 0.5
        menuButton.layer.masksToBounds = true
        
        breakfastTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellID)
//        lunchTableView.dataSource = self
//        dinnerTableView.dataSource = self
//        snacksTableView.dataSource = self
        
        
    }
    
    
}
//MARK: - Table View Code

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodLogs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! FoodLogCell
        cell.textLabel?.text = foodLogs[indexPath.row].name
        return cell
    }
}
    
//MARK: - Table View Delegate

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
