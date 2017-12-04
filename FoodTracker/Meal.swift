//
//  Meal.swift
//  FoodTracker
//
//  Created by Javier Xing on 2017-12-04.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject{
    
    //Mark: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    var calories: Int
    var mealDescription: String
    var mealID: Int?
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        static let calories = "calories"
        static let mealDescription = "mealDescription"
        static let mealID = "mealID"
    }
    
    
    //Mark: Initizalizer
    
    init?(name: String, photo: UIImage?, rating: Int, calories: Int, mealDescription: String) {
        // Initialization should fail if there is no name or if the rating is negative.
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        
        self.name = name
        self.photo = photo
        self.rating = rating
        self.calories = calories
        self.mealDescription = mealDescription
        self.mealID = nil
    }
    
}
