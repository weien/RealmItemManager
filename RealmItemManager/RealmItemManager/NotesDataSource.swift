//
//  NotesDataSource.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class NotesDataSource: NSObject {
    let viewModel: NotesViewModel
    
    init(tableView: UITableView, viewModel: NotesViewModel) {
        self.viewModel = viewModel
        super.init()
        tableView.dataSource = self
    }
}

extension NotesDataSource: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfNotesInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NoteListCell
        cell.contentLabel!.text = self.viewModel.noteContentForIndexpath(indexPath)
        return cell
    }
}