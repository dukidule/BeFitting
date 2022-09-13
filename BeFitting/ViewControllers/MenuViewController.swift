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
        fetchData()
        currentDate = dateLabel.text!
        print("salama dama \(currentDate)")
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }
    var dateSelection: NSDate!
    var currentDate = ""
    var cellIDForTable = "breakfastTable"
    //FoodLog arrays
    var breakfastFoodLogs: [FoodLog] = [
        FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0),
    ]
    var lunchFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)]
    var dinnerFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)]
    var snacksFoodLogs: [FoodLog] = [FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)]
    
    
    var defaultFood = FoodLog(name: "", calories: "", measurement: "", quantity: "", protein: "", carbs: "", fats: "", counter: 0, date: "", dateInSeconds: 0)
    var currentIndex: Int?
    var foodLogsArrayCount: Int?
    
    var storeUser = StoreUser()
    var fetchUser = GetUser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Date
        
        dateSelection = NSDate()
        dateLabel.text = dateSelection.formatted
        
        fetchData()
        
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
    @IBAction func menuButtonPressed(_ sender: UIButton) {
//        let selectionVc = storyboard?.instantiateViewController(identifier: K.toSearchVCId) as! SearchViewController
//        present(selectionVc, animated: true, completion: nil)
        
//        storeUser.storeUser(food: defaultFood, id: cellIDForTable)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Test" + "\(cellIDForTable)")
       DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(550)){
        self.breakfastTableView.reloadData()
        self.lunchTableView.reloadData()
        self.dinnerTableView.reloadData()
        self.snacksTableView.reloadData()
       }
        
    }
//    func isBreakfastTable() {
//        cellIDForTable = "breakfastFoodLogID"
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("bla" + "\(breakfastFoodLogs.count)")
        print("Alex" + " " + "\(breakfastFoodLogs)")
        print("Test" + "\(cellIDForTable)")
        super.viewDidAppear(animated)
        print("69 + \(lunchFoodLogs)")
        print("Test" + "\(cellIDForTable)")
    }
    
    func fetchData() {
        
        fetchUser.currentDate = dateLabel.text!
        print("SediDole2 \(fetchUser.currentDate)")
        fetchUser.getUser(id: "breakfastTable")
        fetchUser.getUser(id: "lunchTable")
        fetchUser.getUser(id: "dinnerTable")
        fetchUser.getUser(id: "snacksTable")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(650)){
            self.breakfastFoodLogs = self.fetchUser.breakfast
            self.lunchFoodLogs = self.fetchUser.lunch
            self.dinnerFoodLogs = self.fetchUser.dinner
            self.snacksFoodLogs = self.fetchUser.snacks
            
            print("Degustacija1 \(self.breakfastFoodLogs)")
            print("degustacija2 \(self.lunchFoodLogs)")
            
            
            self.breakfastFoodLogs.append(self.defaultFood)
            self.lunchFoodLogs.append(self.defaultFood)
            self.dinnerFoodLogs.append(self.defaultFood)
            self.snacksFoodLogs.append(self.defaultFood)
            
            self.breakfastTableView.reloadData()
            self.lunchTableView.reloadData()
            self.dinnerTableView.reloadData()
            self.snacksTableView.reloadData()
            
            self.currentDate = self.dateLabel.text!
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






