//
//  NoteListCell.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class NoteListCell: UITableViewCell {
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var deleteNoteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentTextField.hidden = true
    }
}
