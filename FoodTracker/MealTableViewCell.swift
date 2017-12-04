//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Javier Xing on 2017-12-04.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
//MARK: Properties
    

    @IBOutlet weak var nameLabel: UILabel!
    

    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
