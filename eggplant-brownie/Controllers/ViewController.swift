//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Andre Almeida on 28/06/21.
//

import UIKit

protocol AddMealDelegate {
    func addMeal(_ meal: Meal)
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    
    // MARK: - Properties
    var delegate: AddMealDelegate?
    var itens: [Item] = [
        Item(name: "Tomato sauce", calories: 50.9),
        Item(name: "Sugar", calories: 440.0),
        Item(name: "Milk", calories: 38.0)
    ]
    var selectedItens: [Item] = []
    
    // MARK: - IBOutlets
    @IBOutlet var foodTextField: UITextField?
    @IBOutlet var happinessTextField: UITextField?
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "AddMealTableView")
        cell.textLabel?.text = itens[indexPath.row].name
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            selectedItens.append(itens[indexPath.row])
        } else {
            cell.accessoryType = .none
            if let position = selectedItens.firstIndex(of: itens[indexPath.row]){
                selectedItens.remove(at: position)
            }
        }
        
        
    }
    
    
    // MARK: - IBActions
    @IBAction func add(){
        if let food = foodTextField?.text,
           let happiness = happinessTextField?.text {
            if let happiness = Int(happiness) {
                let meal = Meal(name: food, hapiness: happiness, itens: selectedItens)
                print("Meal: \(meal.name) | Happiness: \(meal.hapiness)")
                delegate? .addMeal(meal)
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

