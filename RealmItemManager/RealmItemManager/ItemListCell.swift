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
    
    //var notesData: [Note]?
    var notesDataSource: NotesDataSource?
    var notesViewModel: NotesViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentTextField.hidden = true
        self.miniTableHeightConstraint.constant = 0
        self.miniTable.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func setupNotes(notes:[Note]) {
        if self.notesViewModel == nil {
            self.notesViewModel = NotesViewModel(notes: notes)
            self.notesDataSource = NotesDataSource(viewModel: self.notesViewModel!)
        }
        //self.notesData = notes
    }
}
