//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Andre Almeida on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController: TableViewVC?
    
    @IBOutlet var foodTextField: UITextField?
    @IBOutlet var happinessTextField: UITextField?
    
    
    
    @IBAction func add(){
        if let food = foodTextField?.text,
           let happiness = happinessTextField?.text {
            if let happiness = Int(happiness) {
                let meal = Meal(name: food, hapiness: happiness)
                print("Meal: \(meal.name) | Happiness: \(meal.hapiness)")
                tableViewController?.addMeal(meal)
                navigationController?.popViewController(animated: true)
            } else {
                print("error")
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

