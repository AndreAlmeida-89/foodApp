//
//  AddItemVC.swift
//  eggplant-brownie
//
//  Created by Andre Almeida on 29/06/21.
//

import UIKit

protocol AddItemVCDelegate {
    func addItem(_ item: Item)
}

class AddItemVC: UIViewController {
    
    // MARK: - Properties
    var delegate: AddItemVCDelegate?
    
    
    // MARK: - View life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(delegate: AddItemVCDelegate) {
        super.init(nibName: "AddItemVC", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Mark: - ABOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    
    
    // MARK: - ABAction
    @IBAction func addItem(_ sender: Any) {
        guard let name = nameTextField.text, let calories = caloriesTextField.text else { return }
        guard let colories = Double(calories) else { return }
        
        let item = Item(name: name, calories: colories)
        delegate?.addItem(item)
        navigationController?.popViewController(animated: true)
    }
    
}
