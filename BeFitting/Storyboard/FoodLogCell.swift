//
//  FoodLogCell.swift
//  BeFitting
//
//  Created by Milos Pavlovic on 3/11/22.
//  Copyright © 2022 Milos Pavlovic. All rights reserved.
//

import UIKit

class FoodLogCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var measurementLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var proteinLabel: UILabel!
    @IBOutlet var carbsLabel: UILabel!
    @IBOutlet var fatsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
