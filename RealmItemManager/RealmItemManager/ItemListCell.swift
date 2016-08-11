//
//  ItemListCell.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class ItemListCell: UITableViewCell {
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var addCommentButton: UIButton!
    @IBOutlet var deleteItemButton: UIButton!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var miniTable: UITableView!
    @IBOutlet var miniTableHeightConstraint: NSLayoutConstraint!
    
//    var notesData: [Note]?
    var parentItem: Item?
    var notesDataSource: NotesDataSource?
    var notesViewModel: NotesViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentTextField.hidden = true
        self.miniTableHeightConstraint.constant = 0
        self.miniTable.tableFooterView = UIView(frame: CGRectZero)
        
//        if parentItem != nil {
//            
//        }
    }
    
//    func setupNotes(notes:[Note]) {
//        self.notesData = notes
//    }
    
    func addNote() {
        if self.notesViewModel == nil {
            self.notesViewModel = NotesViewModel(item: parentItem!)
            self.notesDataSource = NotesDataSource(tableView: self.miniTable, viewModel: self.notesViewModel!)
        }
        
        self.notesViewModel?.addPlaceholderNote()
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.miniTable.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        let cell = self.miniTable.cellForRowAtIndexPath(indexPath) as! NoteListCell
        cell.contentLabel.hidden = true
        cell.contentTextField.hidden = false
        cell.contentTextField.becomeFirstResponder()
//        cell.contentTextField.delegate = self.mainFieldDelegate
        cell.contentTextField.text = ""
    }
}
