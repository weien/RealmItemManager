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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentTextField.hidden = true
        self.miniTableHeightConstraint.constant = 0
        self.miniTable.tableFooterView = UIView(frame: CGRectZero)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
