//
//  NotesViewModel.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class NotesViewModel: NSObject {
    var notes: [Note]
    var storageController: StorageController
    
    init(notes:[Note]) {
        self.storageController = StorageController()
        self.notes = notes
        super.init()
    }
    
    func numberOfNotesInSection(section: Int) -> Int {
        return Int(self.notes.count)
    }
    
    func noteContentForIndexpath(indexPath: NSIndexPath) -> String {
        return self.notes[indexPath.row].content
    }
    
    func addPlaceholderNote() {
//        let item = Item()
//        item.content = ""
//        self.notes.insert(item, atIndex: 0)
    }
}
