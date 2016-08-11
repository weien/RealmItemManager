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
    var parentItem: Item
    
    init(item:Item) {
        self.parentItem = item
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
    
    func noteContentForIndexPath(indexPath: NSIndexPath) -> String {
        return self.notes[indexPath.row].content
    }

    func refreshNotes() {
        let results = self.storageController.retrieveAllNotesForItem(self.parentItem)
        self.notes = [Note]()
        for object in results {
            self.notes.append(object as! Note)
        }
    }
    
    func addPlaceholderNote() {
        let note = Note()
        note.content = ""
        self.notes.insert(note, atIndex: 0)
    }
    
    func addNewNoteithContent(content: String) {
        let note = Note()
        note.content = content
        note.item = self.parentItem
        self.storageController.addObjectToRealm(note)
    }
}
