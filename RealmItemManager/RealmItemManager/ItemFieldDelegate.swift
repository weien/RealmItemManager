//
//  ItemFieldDelegate.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class ItemFieldDelegate: NSObject {
    let viewModel: ItemListViewModel
    let tableView: UITableView
    
    init(tableView: UITableView, viewModel: ItemListViewModel) {
        self.viewModel = viewModel
        self.tableView = tableView
        
        super.init()
    }
}

extension ItemFieldDelegate: UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField) {
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! ItemListCell
        
        if cell.contentTextField.text != "" {
            cell.contentLabel.text = cell.contentTextField.text
            cell.contentLabel.hidden = false
            cell.contentTextField.hidden = true
            self.viewModel.addNewItemWithContent(cell.contentLabel.text!)
            self.viewModel.refreshItems()
        }
        else {
            self.viewModel.refreshItems()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        }
        self.tableView.reloadData()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}