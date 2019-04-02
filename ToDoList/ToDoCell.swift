//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Andrew Morris on 4/1/19.
//  Copyright © 2019 Andrew Morris. All rights reserved.
//
import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
     var delegate: ToDoCellDelegate?
    
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBOutlet weak var titleLabel: UITextField!
    
    
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
    }
}
