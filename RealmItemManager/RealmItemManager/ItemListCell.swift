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
    
    var notesDataSource: NotesDataSource?
    var notesViewModel: NotesViewModel?
    var noteFieldDelegate: NoteFieldDelegate?
    weak var parentTable: UITableView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentTextField.hidden = true
        self.miniTableHeightConstraint.constant = 0
        self.miniTable.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func setupCellWithItem(parentItem:Item, parentTable:UITableView) {
        self.notesViewModel = NotesViewModel(item: parentItem)
        self.notesDataSource = NotesDataSource(tableView: self.miniTable, viewModel: self.notesViewModel!)
        self.noteFieldDelegate = NoteFieldDelegate(tableView: self.miniTable, viewModel: self.notesViewModel!)
        self.parentTable = parentTable
    }
    
    func adjustLayoutForNumberOfNotes(numberOfNotes:Int) {
        self.miniTableHeightConstraint.constant = CGFloat(min(numberOfNotes*22, 88))
        self.parentTable!.beginUpdates()
        self.parentTable!.endUpdates()
    }
    
    func addNote() {
        self.notesViewModel?.addPlaceholderNote()
        let numberOfNotes = self.notesViewModel?.numberOfNotesInSection(0)
        self.adjustLayoutForNumberOfNotes(numberOfNotes!)
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.miniTable.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        let cell = self.miniTable.cellForRowAtIndexPath(indexPath) as! NoteListCell
        cell.contentLabel.hidden = true
        cell.contentTextField.hidden = false
        cell.contentTextField.delegate = self.noteFieldDelegate
        cell.contentTextField.text = ""
        cell.contentTextField.becomeFirstResponder()
    }
}
