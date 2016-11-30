//
//  ManageListsViewController.swift
//  MyGroceryApp
//
//  Created by SBulama on 11/29/16.
//  Copyright © 2016 Hasmaya Tech. All rights reserved.
//

import UIKit

class ManageListsViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Variables
    
    @IBOutlet weak var NameOfGroceryListInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NameOfGroceryListInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func addList()
    {
        guard  NameOfGroceryListInput!.text != nil || !(NameOfGroceryListInput!.text?.isEmpty)! else {
            showAlert("Please, enter a name to continue...", title: "Missing Name")
            return
        }
        
        showAlert(NameOfGroceryListInput.text!, title: "New List")
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Helper Functions
    func showAlert(_ message: String, title: String) {
        let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
