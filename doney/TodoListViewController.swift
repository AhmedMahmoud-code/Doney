//
//  ViewController.swift
//  doney
//
//  Created by Ahmed Mahmoud on 13.09.19.
//  Copyright © 2019 Ahmed Mahmoud. All rights reserved.
//

import UIKit

class TodoListController: UITableViewController {
    
    var deletePlanetIndexPath: NSIndexPath? = nil
    
    var itemArray : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   //MARK - TableView Datesource Methods
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let alert = UIAlertController(title: "This will delete the selected item.", message: "", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
                
                self.itemArray.remove(at: indexPath.row)
                tableView.reloadData()
                
                 }
            let cancellAction = UIAlertAction(title: "Cancel", style: .default) { (cancel) in
                alert.dismiss(animated: true, completion: {
                    tableView.reloadData()
                })
            }
            
           
            alert.addAction(cancellAction)
            alert.addAction(deleteAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row ]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    
    //MARK - TableViewDeleget Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new Item
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Doney Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print(textField.text!)
       
            if textField.text! != "" {
                
                 self.itemArray.append(textField.text!)
            }
           
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new Doney"
            
                textField = alertTextField
            
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}

