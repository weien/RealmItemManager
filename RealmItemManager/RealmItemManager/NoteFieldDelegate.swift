//
//  NoteFieldDelegate.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class NoteFieldDelegate: NSObject {
    let viewModel: NotesViewModel
    let tableView: UITableView
    
    init(tableView: UITableView, viewModel: NotesViewModel) {
        self.viewModel = viewModel
        self.tableView = tableView
        
        super.init()
    }
}

extension NoteFieldDelegate: UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField) {
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! NoteListCell
        
        if cell.contentTextField.text != "" {
            cell.contentLabel.text = cell.contentTextField.text
            cell.contentLabel.hidden = false
            cell.contentTextField.hidden = true
            self.viewModel.addNewNoteithContent(cell.contentLabel.text!)
            self.viewModel.refreshNotes()
        }
        else {
            self.viewModel.refreshNotes()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}