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
    var mainViewModel: ItemListViewModel?
    var mainFieldDelegate: ItemFieldDelegate?
    
    var isNotesVC: Bool?
    var itemLabel: UILabel!
    var parentItem: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (isNotesVC == true) {
            self.title = NSLocalizedString("Notes", comment: "notesHeader")
            let sharedFrame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 28)
            self.mainTableView.tableHeaderView = UIView(frame: sharedFrame)
            self.itemLabel = UILabel(frame: sharedFrame)
            self.itemLabel.text = self.parentItem!.content
            self.itemLabel.textAlignment = NSTextAlignment.Center
            self.mainTableView.tableHeaderView!.addSubview(self.itemLabel)
        }
        else {
            self.title = NSLocalizedString("Tasks", comment: "tasksHeader")
        }
        
        self.mainViewModel = ItemListViewModel(parentItem:parentItem)
        self.mainDataSource = ItemListDataSource(tableView: self.mainTableView, viewModel: self.mainViewModel!)
        self.mainFieldDelegate = ItemFieldDelegate(tableView: self.mainTableView, viewModel: self.mainViewModel!)
        
        self.mainTableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.mainTableView.reloadData()
    }

    @IBAction func addItemButtonTapped(sender: AnyObject) {
        self.mainViewModel?.addPlaceholderItem()
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.mainTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        let cell = self.mainTableView.cellForRowAtIndexPath(indexPath) as! ItemListCell
        cell.contentLabel.hidden = true
        cell.contentTextField.hidden = false
        cell.contentTextField.becomeFirstResponder()
        cell.contentTextField.delegate = self.mainFieldDelegate
        cell.contentTextField.text = ""
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
            let itemToDelete = self.mainViewModel!.items[indexPath!.row]
            self.mainViewModel?.deleteItem(itemToDelete)
            self.mainViewModel?.refreshItems()
            self.mainTableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let buttonPosition = sender!.convertPoint(CGPointZero, toView:self.mainTableView)
        let indexPath = self.mainTableView.indexPathForRowAtPoint(buttonPosition)
        let cell = self.mainTableView.cellForRowAtIndexPath(indexPath!) as! ItemListCell
        
        let targetVC = segue.destinationViewController as! ItemListViewController
        targetVC.isNotesVC = true
        
        if cell.contentTextField.isFirstResponder() && cell.contentTextField.text != "" {
            targetVC.parentItem = self.mainViewModel?.addNewItemWithContent(cell.contentTextField.text!)
            self.mainFieldDelegate?.shouldSkipExtraSave = true
        }
        else {
            targetVC.parentItem = self.mainViewModel?.itemForIndexPath(indexPath!)
        }
    }
    
    @IBAction func addNoteButtonTapped(sender: AnyObject) {
        let buttonPosition = sender.convertPoint(CGPointZero, toView:self.mainTableView)
        let indexPath = self.mainTableView.indexPathForRowAtPoint(buttonPosition)
        let cell = self.mainTableView.cellForRowAtIndexPath(indexPath!) as! ItemListCell
        
        if (cell.contentTextField.text != "") {
            self.performSegueWithIdentifier("ItemToNotes", sender: sender)
        }
    }
}
