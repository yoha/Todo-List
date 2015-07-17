//
//  FirstViewController.swift
//  Todo List
//
//  Created by Yohannes Wijaya on 7/6/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

var arrayOfTodos = [String]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var todoListTableView: UITableView!
    
//    func editButtonPressed() {
//        todoListTableView.setEditing(!todoListTableView.editing, animated: true)
//        if todoListTableView.editing {
//            self.navigationItem.rightBarButtonItem?.title = "Done"
//        }
//        else {
//            self.navigationItem.rightBarButtonItem?.title = "Edit"
//        }
//    }
    
    // MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "editButtonPressed")
        navigationItem.leftBarButtonItem = editButtonItem()
        if let todoListSavedData = NSUserDefaults.standardUserDefaults().objectForKey("todoListSavedData") {
            arrayOfTodos = todoListSavedData as! [String]
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        todoListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        todoListTableView.setEditing(editing, animated: animated)
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTodos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let eachCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "prototypeCell")
        eachCell.textLabel!.text = arrayOfTodos[indexPath.row]
        return eachCell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            arrayOfTodos.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(arrayOfTodos, forKey: "todoListSavedData")
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // Override to support rearranging the table view.
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
    }
    
    // Override to support conditional rearranging of the table view.
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
}

