//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Andre Almeida on 28/06/21.
//

import UIKit

class Meal: NSObject {
    
    
    let name: String
    let  hapiness: Int
    var  itens: Array<Item>
    
    init(name: String, hapiness: Int, itens: [Item] = []) {
        self.name = name
        self.hapiness = hapiness
        self.itens = itens
    }
    
    func addItem(_ item: Item) {
        itens.append(item)
    }
    
    func getToltalCalories () -> Double {
        var totalCalories = 0.0
        for item in itens {
            totalCalories += item.calories
        }
        return totalCalories
    }
}
