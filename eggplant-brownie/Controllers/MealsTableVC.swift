//
//  TableViewVC.swift
//  eggplant-brownie
//
//  Created by Andre Almeida on 28/06/21.
//

import UIKit

class MealsTableVC: UITableViewController, AddMealDelegate {
    var meals = [
        Meal(name: "Potato", hapiness: 5),
        Meal(name: "Pizza", hapiness: 4),
        Meal(name: "Burguer", hapiness: 3)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        cell.textLabel?.text = meals[indexPath.row].name
        return cell
    }
    
    func addMeal(_ meal: Meal){
        meals.append(meal)
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMeal" {
            
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }

}
