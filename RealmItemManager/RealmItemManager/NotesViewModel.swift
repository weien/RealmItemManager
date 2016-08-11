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
    
    init(item:Item) {
        self.storageController = StorageController()
        let results = self.storageController.retrieveAllNotesForItem(item)
        self.notes = [Note]()
        for object in results {
            self.notes.append(object as! Note)
        }
        super.init()
    }
    
    func numberOfNotesInSection(section: Int) -> Int {
        return Int(self.notes.count)
    }
    
    func noteContentForIndexpath(indexPath: NSIndexPath) -> String {
        return self.notes[indexPath.row].content
    }
    
    func addPlaceholderNote() {
        let note = Note()
        note.content = ""
        self.notes.insert(note, atIndex: 0)
    }
}
