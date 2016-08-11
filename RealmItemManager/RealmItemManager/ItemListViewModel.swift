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
    var parentItem: Item?
    
    init(parentItem:Item?) {
        self.storageController = StorageController()
        self.items = [RLMObject]()
        self.parentItem = parentItem
        super.init()
        self.refreshItems()
    }
    
    func refreshItems() {
        var results: RLMResults
        if let unwrappedItem = self.parentItem {
            self.parentItem = unwrappedItem
            results = self.storageController.retrieveAllNotesForItem(unwrappedItem)
        }
        else {
            results = self.storageController.retrieveAllItems()
        }
        self.items = [RLMObject]()
        for object in results {
            self.items.append(object)
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return Int(self.items.count)
    }
    
    func itemContentForIndexPath(indexPath: NSIndexPath) -> String {
        let item = self.items[indexPath.row]
        return item.valueForKeyPath("content") as! String
    }
    
    func itemForIndexPath(indexPath:NSIndexPath) -> Item {
        let item = self.items[indexPath.row] as? Item
        return item!
    }
    
    func addNewItemWithContent(content: String) -> Item? {
        if (parentItem == nil) {
            let item = Item()
            item.content = content
            self.storageController.addObjectToRealm(item)
            return item
        }
        else {
            let item = Note()
            item.content = content
            item.item = parentItem
            self.storageController.addObjectToRealm(item)
            return nil
        }
    }
    
    func addPlaceholderItem() {
        if (parentItem == nil) {
            let item = Item()
            item.content = ""
            self.items.insert(item, atIndex: 0)
        }
        else {
            let item = Note()
            item.content = ""
            self.items.insert(item, atIndex: 0)
        }
    
    }
    
    func deleteItem(item: RLMObject) {
        self.storageController.deleteObjectFromRealm(item)
    }
}