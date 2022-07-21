//
//  MenuViewController.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 2/7/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    static var controllerId: Int = 0
    
    static func generateInstanceId() -> Int {
        let old = controllerId
        controllerId += 1
        return old
    }
    
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
    fileprivate(set) var cellIDForTable = "I love cheesepufs \(generateInstanceId())"
    //FoodLog arrays
    var breakfastFoodLogs: [FoodLog] = [
        FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0),
    ]
    var lunchFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)]
    var dinnerFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)]
    var snacksFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)]
    
    
    var defaultFood = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0)
    var currentIndex: Int?
    var foodLogsArrayCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Date
        
        dateSelection = NSDate()
        dateLabel.text = dateSelection.formatted
        
        breakfastTableView.reloadData()
        lunchTableView.reloadData()
        snacksTableView.reloadData()
        print(breakfastFoodLogs)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print("Test" + "\(cellIDForTable)")
        
        
    }
    func isBreakfastTable() {
        cellIDForTable = "breakfastFoodLogID"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("bla" + "\(breakfastFoodLogs.count)")
        print("Alex" + " " + "\(breakfastFoodLogs)")
        print("Test" + "\(cellIDForTable)")
        super.viewDidAppear(animated)
        print("69 + \(lunchFoodLogs)")
        print("Test" + "\(cellIDForTable)")
    }
    
    //    func elementShift(array: Array<Any>) -> Int {
    //        let array = breakfastFoodLogs
    //        for index in breakfastFoodLogs.indices {
    //            let currentIndex = index + 1
    //            index == currentIndex
    //        }
    //    }
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
        }
        else if tableView == snacksTableView {
            return snacksFoodLogs.count
        } else {
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! FoodLogCell
        
        if tableView == breakfastTableView {
            cell.nameLabel.text = breakfastFoodLogs[indexPath.row].name
            cell.measurementLabel.text = breakfastFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = breakfastFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = breakfastFoodLogs[indexPath.row].calories
            cell.proteinLabel.text = breakfastFoodLogs[indexPath.row].protein
            cell.carbsLabel.text = breakfastFoodLogs[indexPath.row].carbs
            cell.fatsLabel.text = breakfastFoodLogs[indexPath.row].fats
            
        }
        if tableView == lunchTableView {
            cell.nameLabel.text = lunchFoodLogs[indexPath.row].name
            cell.measurementLabel.text = lunchFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = lunchFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = lunchFoodLogs[indexPath.row].calories
            cell.proteinLabel.text = lunchFoodLogs[indexPath.row].protein
            cell.carbsLabel.text = lunchFoodLogs[indexPath.row].carbs
            cell.fatsLabel.text = lunchFoodLogs[indexPath.row].fats
            
        }
        if tableView == dinnerTableView {
            cell.nameLabel.text = dinnerFoodLogs[indexPath.row].name
            cell.measurementLabel.text = dinnerFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = dinnerFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = dinnerFoodLogs[indexPath.row].calories
            cell.proteinLabel.text = dinnerFoodLogs[indexPath.row].protein
            cell.carbsLabel.text = dinnerFoodLogs[indexPath.row].carbs
            cell.fatsLabel.text = dinnerFoodLogs[indexPath.row].fats
            
        }
        if tableView == snacksTableView {
            cell.nameLabel.text = snacksFoodLogs[indexPath.row].name
            cell.measurementLabel.text = snacksFoodLogs[indexPath.row].measurement
            cell.quantityLabel.text = snacksFoodLogs[indexPath.row].quantity
            cell.caloriesLabel.text = snacksFoodLogs[indexPath.row].calories
            cell.proteinLabel.text = snacksFoodLogs[indexPath.row].protein
            cell.carbsLabel.text = snacksFoodLogs[indexPath.row].carbs
            cell.fatsLabel.text = snacksFoodLogs[indexPath.row].fats
            
        }
        print(indexPath)
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
            if indexPath.row == 0 {
                cellIDForTable = "breakfastTable"
                currentIndex = indexPath.row
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = breakfastFoodLogs[currentIndex!]
                present(selectionVc, animated: true, completion: nil)
                print(indexPath)
            } else {
                if indexPath.row > 0 {
                    cellIDForTable = "breakfastTable"
                    currentIndex = indexPath.row
                    foodLogsArrayCount = breakfastFoodLogs.count
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
                    selectionVc.passingFoodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = breakfastFoodLogs[currentIndex!]
                    
                    present(selectionVc, animated: true, completion: nil)
                    
                    print("hihi \(breakfastFoodLogs)")
                    print(indexPath.row)
                    //                    breakfastFoodLogs.remove(at: indexPath.row)
                }
            }
        }
        else if tableView == lunchTableView {
            if indexPath.row == 0 {
                cellIDForTable = "lunchTable"
                currentIndex = indexPath.row
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = lunchFoodLogs[currentIndex!]
                present(selectionVc, animated: true, completion: nil)
                print(indexPath)
            } else {
                if indexPath.row > 0 {
                    cellIDForTable = "lunchTable"
                    currentIndex = indexPath.row
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
                    selectionVc.passingFoodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = lunchFoodLogs[currentIndex!]
                    
                    present(selectionVc, animated: true, completion: nil)
                    print("hihi \(breakfastFoodLogs)")
                    print(indexPath.row)
                    //                    breakfastFoodLogs.remove(at: indexPath.row)
                }
            }
        } else if tableView == dinnerTableView {
            if indexPath.row == 0 {
            cellIDForTable = "dinnerTable"
                currentIndex = indexPath.row
            let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
            selectionVc.passingFoodDelegate = self
            selectionVc.tableId = cellIDForTable
                selectionVc.food = dinnerFoodLogs[currentIndex!]
            present(selectionVc, animated: true, completion: nil)
            } else if indexPath.row > 0 {
                cellIDForTable = "dinnerTable"
                currentIndex = indexPath.row
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = dinnerFoodLogs[currentIndex!]
                
                present(selectionVc, animated: true, completion: nil)
                
            }
        } else if tableView == snacksTableView {
            if indexPath.row == 0 {
            cellIDForTable = "snacksTable"
                currentIndex = indexPath.row
            let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
            selectionVc.passingFoodDelegate = self
            selectionVc.tableId = cellIDForTable
                selectionVc.food = snacksFoodLogs[currentIndex!]
            present(selectionVc, animated: true, completion: nil)
            } else if indexPath.row > 0 {
                cellIDForTable = "snacksTable"
                currentIndex = indexPath.row
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "foodViewController") as! FoodViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = snacksFoodLogs[currentIndex!]
                
                present(selectionVc, animated: true, completion: nil)
                
            }
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

//MARK: - Getting Food from FoodVC

extension MenuViewController: PassingFood {
    func passFood(food: FoodLog, id: String) {
        var currentFood: FoodLog
        if id == "breakfastTable" {
            currentFood = breakfastFoodLogs[currentIndex!]
            if currentFood.name == "" {
                
                breakfastFoodLogs.insert(food, at: 0)
                breakfastTableView.reloadData()
            } else if currentFood.name != "" {
                breakfastFoodLogs[currentIndex!] = food
                breakfastTableView.reloadData()
            }
            
        } else if id == "lunchTable" {
            currentFood = lunchFoodLogs[currentIndex!]
            if currentFood.name == "" {
            lunchFoodLogs.insert(food, at: 0)
            lunchTableView.reloadData()
            }
            else if currentFood.name != "" {
                lunchFoodLogs[currentIndex!] = food
                breakfastTableView.reloadData()
            }
        } else if id == "dinnerTable" {
            currentFood = dinnerFoodLogs[currentIndex!]
            if currentFood.name == "" {
            dinnerFoodLogs.insert(food, at: 0)
            dinnerTableView.reloadData()
            }
            else if currentFood.name != "" {
                dinnerFoodLogs[currentIndex!] = food
                dinnerTableView.reloadData()
            }
        } else if id == "snacksTable" {
            currentFood = snacksFoodLogs[currentIndex!]
            if currentFood.name == "" {
            snacksFoodLogs.insert(food, at: 0)
            snacksTableView.reloadData()
            }
            else if currentFood.name != "" {
                snacksFoodLogs[currentIndex!] = food
                snacksTableView.reloadData()
            }
        }
    }
    
    func removeFood(id: String) {
        var food: FoodLog
        if currentIndex != nil {
            if id == "breakfastTable" && breakfastFoodLogs.count > 1 {
                food = breakfastFoodLogs[(breakfastFoodLogs.count)-1]
                if food.name != "" {
                breakfastFoodLogs.remove(at: currentIndex!)
                    breakfastFoodLogs.append(defaultFood)
                breakfastTableView.reloadData()
                } else if food.name == "" && currentIndex! != breakfastFoodLogs.count-1 {
                    breakfastFoodLogs.remove(at: currentIndex!)
                    breakfastTableView.reloadData()
                } else if food.name == "" && currentIndex! == breakfastFoodLogs.count-1{
                    breakfastFoodLogs.remove(at: currentIndex!)
                    breakfastFoodLogs.append(defaultFood)
                    breakfastTableView.reloadData()
                }
            } else if id == "breakfastTable" && breakfastFoodLogs.count == 1 {
                breakfastFoodLogs.remove(at: currentIndex!)
                breakfastFoodLogs.append(defaultFood)
                breakfastTableView.reloadData()
                
            } else if id == "lunchTable" && lunchFoodLogs.count > 1 {
                food = lunchFoodLogs[(lunchFoodLogs.count)-1]
                if food.name != "" {
                lunchFoodLogs.remove(at: currentIndex!)
                    lunchFoodLogs.append(defaultFood)
                lunchTableView.reloadData()
                } else if food.name == "" && currentIndex! != lunchFoodLogs.count-1 {
                    lunchFoodLogs.remove(at: currentIndex!)
                    lunchTableView.reloadData()
                } else if food.name == "" && currentIndex! == lunchFoodLogs.count-1{
                    lunchFoodLogs.remove(at: currentIndex!)
                    lunchFoodLogs.append(defaultFood)
                    lunchTableView.reloadData()
                }
            } else if id == "lunchTable" && lunchFoodLogs.count == 1 {
                lunchFoodLogs.remove(at: currentIndex!)
                lunchFoodLogs.append(defaultFood)
                lunchTableView.reloadData()
                
            } else if id == "dinnerTable" && dinnerFoodLogs.count > 1 {
                food = dinnerFoodLogs[(dinnerFoodLogs.count)-1]
                if food.name != "" {
                dinnerFoodLogs.remove(at: currentIndex!)
                    dinnerFoodLogs.append(defaultFood)
                dinnerTableView.reloadData()
                } else if food.name == "" && currentIndex! != dinnerFoodLogs.count-1 {
                    dinnerFoodLogs.remove(at: currentIndex!)
                    dinnerTableView.reloadData()
                } else if food.name == "" && currentIndex! == dinnerFoodLogs.count-1{
                    dinnerFoodLogs.remove(at: currentIndex!)
                    dinnerFoodLogs.append(defaultFood)
                    dinnerTableView.reloadData()
                }
            } else if id == "dinnerTable" && dinnerFoodLogs.count == 1 {
                dinnerFoodLogs.remove(at: currentIndex!)
                dinnerFoodLogs.append(defaultFood)
                dinnerTableView.reloadData()
                
            } else if id == "snacksTable" && snacksFoodLogs.count > 1 {
                food = snacksFoodLogs[(snacksFoodLogs.count)-1]
                if food.name != "" {
               snacksFoodLogs.remove(at: currentIndex!)
                    snacksFoodLogs.append(defaultFood)
                snacksTableView.reloadData()
                } else if food.name == "" && currentIndex! != snacksFoodLogs.count-1 {
                    snacksFoodLogs.remove(at: currentIndex!)
                    snacksTableView.reloadData()
                } else if food.name == "" && currentIndex! == snacksFoodLogs.count-1{
                    snacksFoodLogs.remove(at: currentIndex!)
                    snacksFoodLogs.append(defaultFood)
                    snacksTableView.reloadData()
                }
            } else if id == "snacksTable" && snacksFoodLogs.count == 1 {
                snacksFoodLogs.remove(at: currentIndex!)
                snacksFoodLogs.append(defaultFood)
                snacksTableView.reloadData()
            }
        }
    }
    
}


