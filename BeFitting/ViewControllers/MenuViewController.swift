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
  
    //FoodLog arrays
    var breakfastFoodLogs: [FoodLog] = [
        FoodLog(name: "Sarma", calories: 128, protein: 23, carbs: 22, fats: 38),
        FoodLog(name: "Pljeskavica", calories: 512, protein: 26, carbs: 35, fats: 67)
    ]
    var lunchFoodLogs: [FoodLog] = []
    var dinnerFoodLogs: [FoodLog] = []
    var snacksFoodLogs: [FoodLog] = []
    
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
            return breakfastFoodLogs.count
        }
        else if tableView == lunchTableView {
            return lunchFoodLogs.count
        }
        else if tableView == dinnerTableView {
            return dinnerFoodLogs.count
        } else if tableView == snacksTableView {
            return snacksFoodLogs.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! FoodLogCell
        cell.textLabel?.text = breakfastFoodLogs[indexPath.row].name
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
        self.performSegue(withIdentifier: "toFoodViewController", sender: indexPath)
    }
    //NA IVICI DA PRESTANE DA JEDE GOVNA
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
