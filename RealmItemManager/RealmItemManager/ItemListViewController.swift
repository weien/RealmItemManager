//
//  ItemListViewController.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var mainTableView: UITableView!
    var mainDataSource: ItemListDataSource?
    var mainDelegate: ItemListDelegate?
    var mainViewModel: ItemListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainViewModel = ItemListViewModel()
        self.mainDataSource = ItemListDataSource(tableView: self.mainTableView, viewModel: self.mainViewModel!)
        self.mainTableView.tableFooterView = UIView(frame: CGRectZero)
    }

    @IBAction func addItemButtonTapped(sender: AnyObject) {
        self.mainViewModel?.addPlaceholderItem()
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.mainTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        let cell = self.mainTableView.cellForRowAtIndexPath(indexPath) as! ItemListCell
        cell.contentLabel.hidden = true
        cell.contentTextField.hidden = false
        cell.contentTextField.becomeFirstResponder()
        cell.contentTextField.delegate = self
        cell.contentTextField.text = ""
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell = self.mainTableView.cellForRowAtIndexPath(indexPath) as! ItemListCell
        
        if cell.contentTextField.text != "" {
            cell.contentLabel.text = cell.contentTextField.text
            cell.contentLabel.hidden = false
            cell.contentTextField.hidden = true
            self.mainViewModel?.addNewItemWithContent(cell.contentLabel.text!)
            self.mainViewModel?.refreshItems()
        }
        else {
            self.mainViewModel?.refreshItems()
            self.mainTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func deleteItemButtonTapped(sender: AnyObject) {
        let buttonPosition = sender.convertPoint(CGPointZero, toView:self.mainTableView)
        let indexPath = self.mainTableView.indexPathForRowAtPoint(buttonPosition)
        let cell = self.mainTableView.cellForRowAtIndexPath(indexPath!) as! ItemListCell
        if cell.contentTextField.isFirstResponder() {
            cell.contentTextField.text = ""
            cell.contentTextField.resignFirstResponder()
        }
        else if indexPath != nil {
            let itemToDelete = self.mainViewModel!.items[indexPath!.row] as! Item
            self.mainViewModel?.deleteItem(itemToDelete)
            self.mainViewModel?.refreshItems()
            self.mainTableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }
}
