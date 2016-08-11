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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.mainTableView.reloadData()
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
        cell.contentLabel.text = cell.contentTextField.text
        cell.contentLabel.hidden = false
        cell.contentTextField.hidden = true
        self.mainViewModel?.addNewItemWithContent(cell.contentLabel.text!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
