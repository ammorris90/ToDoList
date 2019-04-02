//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Andrew Morris on 3/28/19.
//  Copyright © 2019 Andrew Morris. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    var todo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            dueDatePickerView.date = todo.dueDate
            notesTextView.text = todo.notes
        } else {
            dueDatePickerView.date =
                Date().addingTimeInterval(24*60*60)
        }
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()
    }

    
    //so app knows whether datepicker is hidden or not
  /* var isEndDatePickerHidden = true
   
    // open datepicker when tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        switch (indexPath) {
        case [2,0]:
            isEndDatePickerHidden = !isEndDatePickerHidden
            
            dueDatePickerLabel.textColor =
                isEndDatePickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default: break
        }
    }
    // hides datepicker
    override func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        switch(indexPath) {
        case [1,0]: //Due Date Cell
            return isEndDatePickerHidden ? normalCellHeight :
            largeCellHeight
        case [2,0]: //Notes Cell
            return largeCellHeight
        default: return normalCellHeight
        }
    }*/

    
    
   // outlets for all buttons and fields in new To do
    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    
    @IBOutlet weak var dueDatePickerLabel: UILabel!
    
    
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    //saves any changes made
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }

    //dismistoses keyboard when return button in tapped
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    // to match date picker
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    
    
    
    //updates due date label to todays date
    func updateDueDateLabel(date: Date) {
        dueDatePickerLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    
  // Disables save if field is empty
func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    
    // checks if unwind segue is working
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        todo = ToDo(title: title, isComplete: isComplete, dueDate:
            dueDate, notes: notes)
    }
    
    
    
    
}


