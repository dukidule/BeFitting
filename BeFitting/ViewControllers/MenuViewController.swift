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
    //LabelOutlets
    
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var snacksLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //TableViewOutlets
    @IBOutlet weak var breakfastTableView: UITableView!
    @IBOutlet weak var lunchTableView: UITableView!
    @IBOutlet weak var dinnerTableView: UITableView!
    @IBOutlet weak var snacksTableView: UITableView!
    
    //MenuButtonOutlet
    @IBOutlet weak var menuButton: UIButton!
    
    //ConfirmationPopUp Outlets
    
    @IBOutlet weak var confirmationPopUp: UIView!
    @IBOutlet weak var confirmationPopUpText: UILabel!
    @IBOutlet weak var confirmationPopUpYes: UIButton!
    @IBOutlet weak var confirmationPopUpNo: UIButton!
    //Stepper
    
    @IBOutlet weak var dateStepper: UIStepper!
    @IBAction func changingDate(_ sender: UIStepper) {
        dateSelection = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!.date(byAdding: .day, value: Int(sender.value), to: NSDate() as Date, options: []) as NSDate?
        dateLabel.text = dateSelection.formatted
    }
    var dateSelection: NSDate!
    var cellIDForTable: String?
    
    //FoodLog arrays
    var breakfastFoodLogs: [FoodLog] = [
        FoodLog(name: "", calories: "", protein: "", carbs: "", fats: ""),
        FoodLog(name: "Pljeskavica", calories: "512", protein: "26", carbs: "35", fats: "67")
    ]
    var lunchFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", protein: "", carbs: "", fats: "")]
    var dinnerFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", protein: "", carbs: "", fats: "")]
    var snacksFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", protein: "", carbs: "", fats: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Date
        dateSelection = NSDate()
        dateLabel.text = dateSelection.formatted
        
        
        
        //BreakfastTableView
        breakfastTableView.delegate = self
        breakfastTableView.dataSource = self
        breakfastTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellID)
        
        //LunchTableView
        lunchTableView.delegate = self
        lunchTableView.dataSource = self
        lunchTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellID)
        
        //DinnerTableView
        
        dinnerTableView.dataSource = self
        dinnerTableView.delegate = self
        dinnerTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellID)
        //SnacksTableView
        snacksTableView.dataSource = self
        snacksTableView.delegate = self
        snacksTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellID)
        //CircleButton
        menuButton.layer.cornerRadius = menuButton.frame.height * 0.5
        menuButton.layer.masksToBounds = true
        
    }
    
    
}
//MARK: - Table View Code

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == breakfastTableView {
            return 1
        }
        else if tableView == lunchTableView {
            return 1
        }
        else if tableView == dinnerTableView {
            return 1
        }
        else if tableView == snacksTableView {
            return 1
        } else {
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! FoodLogCell
        
        if tableView == breakfastTableView {
            cell.textLabel?.text = breakfastFoodLogs[indexPath.row].name
            cellIDForTable = "breakfastFoodLogID"
        }
        else if tableView == lunchTableView {
            cell.textLabel?.text = lunchFoodLogs[indexPath.row].name
            cellIDForTable = "lunchFoodLogID"
        }
        else if tableView == dinnerTableView {
            cell.textLabel?.text = dinnerFoodLogs[indexPath.row].name
            cellIDForTable = "dinnerFoodLogID"
        }
        else if tableView == snacksTableView {
            cell.textLabel?.text = snacksFoodLogs[indexPath.row].name
            cellIDForTable = "snacksFoodLogID"
        }
        
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 40
    //
    //    }
    
}


//MARK: - Table View Delegate

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == breakfastTableView {
            self.performSegue(withIdentifier: "toFoodViewController", sender: indexPath)
            cellIDForTable = "breakfastTableView"
        }
        else if tableView == lunchTableView {
            self.performSegue(withIdentifier: "toFoodViewController", sender: indexPath)
            cellIDForTable = "lunchTableView"
        } else if tableView == dinnerTableView {
            self.performSegue(withIdentifier: "toFoodViewController", sender: indexPath)
            cellIDForTable = "dinnerTableView"
        } else if tableView == snacksTableView {
            self.performSegue(withIdentifier: "toFoodViewController", sender: indexPath)
            cellIDForTable = "snacksTableView"
        }
    }
}
//MARK: - Date Selection


extension NSDate {
    var formatted: String {
        let dateFormated = DateFormatter()
        let id = getLocale()
        dateFormated.dateFormat = "dd.MM.YYYY."
        dateFormated.locale = NSLocale(localeIdentifier: id) as Locale
        return dateFormated.string(from: self as Date)
    }
    
    func getLocale() -> String {
        let locale = NSLocale.autoupdatingCurrent
        let code = locale.languageCode!
        let identifier = locale.localizedString(forIdentifier: code)!
        return identifier
    }
}
