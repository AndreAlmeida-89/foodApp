//
//  Item.swift
//  eggplant-brownie
//
//  Created by Andre Almeida on 28/06/21.
//

import UIKit

class Item: NSObject {
    let name: String
    let calories: Double
    
    internal init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    
}
