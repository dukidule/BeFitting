//
//  MenuTableDelegate.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == breakfastTableView {
            if indexPath.row == 0 {
                cellIDForTable = "breakfastTable"
                currentIndex = indexPath.row
                if breakfastFoodLogs[indexPath.row].name == "" {
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = breakfastFoodLogs[currentIndex!]
                present(selectionVc, animated: true, completion: nil)
                print(indexPath)
                }
                else if breakfastFoodLogs[indexPath.row].name != "" {
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                    selectionVc.foodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = breakfastFoodLogs[currentIndex!]
                    present(selectionVc, animated: true, completion: nil)
                }
            } else {
                if indexPath.row > 0 {
                    cellIDForTable = "breakfastTable"
                    currentIndex = indexPath.row
                    foodLogsArrayCount = breakfastFoodLogs.count
                    if breakfastFoodLogs[indexPath.row].name == "" {
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
                    selectionVc.passingFoodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = breakfastFoodLogs[currentIndex!]
                    
                    present(selectionVc, animated: true, completion: nil)
                    
                    print("hihi \(breakfastFoodLogs)")
                    print(indexPath.row)
                    } else if breakfastFoodLogs[indexPath.row].name != "" {
                        let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                        selectionVc.foodDelegate = self
                        selectionVc.tableId = cellIDForTable
                        selectionVc.food = breakfastFoodLogs[currentIndex!]
                        present(selectionVc, animated: true, completion: nil)
                    }
                    //                    breakfastFoodLogs.remove(at: indexPath.row)
                }
            }
        }
        else if tableView == lunchTableView {
            if indexPath.row == 0 {
                cellIDForTable = "lunchTable"
                currentIndex = indexPath.row
                if lunchFoodLogs[indexPath.row].name == "" {
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = lunchFoodLogs[currentIndex!]
                present(selectionVc, animated: true, completion: nil)
                print(indexPath)
                }
                else if lunchFoodLogs[indexPath.row].name != "" {
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                    selectionVc.foodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = lunchFoodLogs[currentIndex!]
                    present(selectionVc, animated: true, completion: nil)
                }
            } else {
                if indexPath.row > 0 {
                    cellIDForTable = "lunchTable"
                    currentIndex = indexPath.row
                    foodLogsArrayCount = lunchFoodLogs.count
                    if lunchFoodLogs[indexPath.row].name == "" {
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
                    selectionVc.passingFoodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = lunchFoodLogs[currentIndex!]
                    
                    present(selectionVc, animated: true, completion: nil)
                    
                    print("hihi \(lunchFoodLogs)")
                    print(indexPath.row)
                    } else if lunchFoodLogs[indexPath.row].name != "" {
                        let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                        selectionVc.foodDelegate = self
                        selectionVc.tableId = cellIDForTable
                        selectionVc.food = lunchFoodLogs[currentIndex!]
                        present(selectionVc, animated: true, completion: nil)
                    }
                    //                    breakfastFoodLogs.remove(at: indexPath.row)
                }
            }
        }
    
    else if tableView == dinnerTableView {
        if indexPath.row == 0 {
            cellIDForTable = "dinnerTable"
            currentIndex = indexPath.row
            if dinnerFoodLogs[indexPath.row].name == "" {
            let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
            selectionVc.passingFoodDelegate = self
            selectionVc.tableId = cellIDForTable
            selectionVc.food = dinnerFoodLogs[currentIndex!]
            present(selectionVc, animated: true, completion: nil)
            print(indexPath)
            }
            else if dinnerFoodLogs[indexPath.row].name != "" {
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                selectionVc.foodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = dinnerFoodLogs[currentIndex!]
                present(selectionVc, animated: true, completion: nil)
            }
        } else {
            if indexPath.row > 0 {
                cellIDForTable = "dinnerTable"
                currentIndex = indexPath.row
                foodLogsArrayCount = dinnerFoodLogs.count
                if dinnerFoodLogs[indexPath.row].name == "" {
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = dinnerFoodLogs[currentIndex!]
                
                present(selectionVc, animated: true, completion: nil)
                
                print("hihi \(dinnerFoodLogs)")
                print(indexPath.row)
                } else if dinnerFoodLogs[indexPath.row].name != "" {
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                    selectionVc.foodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = dinnerFoodLogs[currentIndex!]
                    present(selectionVc, animated: true, completion: nil)
                }
                //                    breakfastFoodLogs.remove(at: indexPath.row)
            }
        }
    }
        
        
        else if tableView == snacksTableView {
            if indexPath.row == 0 {
                cellIDForTable = "snacksTable"
                currentIndex = indexPath.row
                if snacksFoodLogs[indexPath.row].name == "" {
                let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
                selectionVc.passingFoodDelegate = self
                selectionVc.tableId = cellIDForTable
                selectionVc.food = snacksFoodLogs[currentIndex!]
                present(selectionVc, animated: true, completion: nil)
                print(indexPath)
                }
                else if snacksFoodLogs[indexPath.row].name != "" {
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                    selectionVc.foodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = snacksFoodLogs[currentIndex!]
                    present(selectionVc, animated: true, completion: nil)
                }
            } else {
                if indexPath.row > 0 {
                    cellIDForTable = "snacksTable"
                    currentIndex = indexPath.row
                    foodLogsArrayCount = snacksFoodLogs.count
                    if snacksFoodLogs[indexPath.row].name == "" {
                    let selectionVc = storyboard?.instantiateViewController(withIdentifier: "toSearchViewController") as! SearchViewController
                    selectionVc.passingFoodDelegate = self
                    selectionVc.tableId = cellIDForTable
                    selectionVc.food = snacksFoodLogs[currentIndex!]
                    
                    present(selectionVc, animated: true, completion: nil)
                    
                    print("hihi \(snacksFoodLogs)")
                    print(indexPath.row)
                    } else if snacksFoodLogs[indexPath.row].name != "" {
                        let selectionVc = storyboard?.instantiateViewController(withIdentifier: "addedFoodViewController") as! AddedFoodViewController
                        selectionVc.foodDelegate = self
                        selectionVc.tableId = cellIDForTable
                        selectionVc.food = snacksFoodLogs[currentIndex!]
                        present(selectionVc, animated: true, completion: nil)
                    }
                    //                    breakfastFoodLogs.remove(at: indexPath.row)
                }
            }
        }
    }
}
