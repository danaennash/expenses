//
//  SingleExpenseViewController.swift
//  Expenses
//
//  Created by Danae N Nash on 8/23/19.
//  Copyright © 2019 Danae N Nash. All rights reserved.
//

import UIKit

class SingleExpenseViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        amountTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    
    @IBAction func saveExpense(_ sender: Any) {
        let name = nameTextField.text
        let amountText = amountTextField.text ?? ""
        let amount = Double(amountText) ?? 0.0
        let date = datePicker.date
        
        
        if let expense = Expense.init(name: name, amount: amount, date: date){
            do{
                let managedContext = expense.managedObjectContext
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Context did not save")
            }
        }
        
    }
}

extension SingleExpenseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
