//
//  SearchVCBar.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 8/4/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

extension SearchViewController: UISearchBarDelegate {
    
    
    func searchData() {
        if let searchText = searchBar?.searchTextField.text {
            searchedFoodsHistory = []
            let lettersCounter = searchText.count
            searchedFoodsHistory = foodsHistory.filter({ return $0.name.prefix(lettersCounter).caseInsensitiveCompare(searchText) == .orderedSame
            })
            historyTableView.reloadData()
            
        }
        else {
            
            searchedFoodsHistory = foodsHistory
            historyTableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        myFoods = foodsHistory
        foodsHistory = []
        getFoods()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            self.searchData()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData()
    }
}
