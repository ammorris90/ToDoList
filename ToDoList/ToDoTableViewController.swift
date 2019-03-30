//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Andrew Morris on 3/27/19.
//  Copyright © 2019 Andrew Morris. All rights reserved.
//
import UIKit

class ToDoTableViewController: UITableViewController {
   
    var todos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            todos = ToDo.loadSampleToDos()
    
        //makes button intelligent switch
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    

    override func tableView(_ tableView: UITableView, canEditRowAt
        indexPath: IndexPath) -> Bool {
        return true
    }
   // to configure where deletion takes place
    override func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
        IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   

    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier:
                "ToDoCellIdentifier") else {
                    fatalError("Could not dequeue a cell")
        }
        
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
        
        
    }
    
    
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as!
        ToDoViewController
        if let todo = sourceViewController.todo {
            let newIndexPath = IndexPath(row: todos.count,
                                         section: 0)
            todos.append(todo)
            tableView.insertRows(at: [newIndexPath],
                                 with: .automatic)
        }
        
    }
   
    
    
}


