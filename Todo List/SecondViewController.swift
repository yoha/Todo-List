//
//  SecondViewController.swift
//  Todo List
//
//  Created by Yohannes Wijaya on 7/6/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties

    @IBOutlet weak var addTodoButton: UIButton!
    @IBOutlet weak var todoItemTextField: UITextField!
    @IBAction func addTodoButton(sender: UIButton) {
        isTodoEntryValid()
        arrayOfTodos.append(todoItemTextField.text!)
        NSUserDefaults.standardUserDefaults().setObject(arrayOfTodos, forKey: "todoListSavedData")
        todoItemTextField.text = ""
        addTodoButton.enabled = false
    }
    
    // MARK: - Custom methods
    
    func isTodoEntryValid() {
        if todoItemTextField.text!.isEmpty {
            addTodoButton.enabled = false
        }
        else {
            addTodoButton.enabled = true
        }
    }
    
    // MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoItemTextField.delegate = self
        addTodoButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITextField Delegate methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        addTodoButton.enabled = true
        todoItemTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        addTodoButton.enabled = false
    }
    
    // MARK: - UIResponder methods
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        isTodoEntryValid()
    }
}

