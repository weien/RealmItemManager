//
//  ItemListViewModel.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class ItemListViewModel: NSObject {
    var items: [RLMObject]
    var storageController: StorageController
    
    override init() {
        self.storageController = StorageController()
        let results = self.storageController.retrieveAllItems()
        self.items = [RLMObject]()
        for object in results {
            self.items.append(object)
        }
        
        super.init()
    }
    
    func refreshItems() {
        let results = self.storageController.retrieveAllItems() //we might be able to store results, intead of re-retrieving here
        self.items = [RLMObject]()
        for object in results {
            self.items.append(object)
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return Int(self.items.count)
    }
    
    func itemContentForIndexpath(indexPath: NSIndexPath) -> String {
        if let item = self.items[indexPath.row] as? Item {
            return item.content
        }
        else {
            return NSLocalizedString("No content available.", comment: "noContent")
        }
    }
    
    func itemForIndexPath(indexPath:NSIndexPath) -> Item {
        if let item = self.items[indexPath.row] as? Item {
            return item
        }
        else {
            return Item() //should not happen
        }
    }
    
//    func childNotesForIndexPath(indexPath: NSIndexPath) -> [RLMObject] {
//        var childNotes = [RLMObject]()
//        if let item = self.items[indexPath.row] as? Item {
//            for note in item.notes {
//                childNotes.append(note)
//            }
//        }
//        return childNotes
//    }
    
    func addNewItemWithContent(content: String) {
        let item = Item()
        item.content = content
        self.storageController.addObjectToRealm(item)
    }
    
    func addPlaceholderItem() {
        let item = Item()
        item.content = ""
        self.items.insert(item, atIndex: 0)
    }
    
    func deleteItem(item: Item) {
        self.storageController.deleteObjectFromRealm(item)
    }
}