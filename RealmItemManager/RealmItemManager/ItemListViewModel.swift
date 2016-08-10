//
//  ItemListViewModel.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class ItemListViewModel: NSObject {
    var items: RLMResults
    var storageController: StorageController
    
    override init() {
        self.storageController = StorageController()
        self.items = self.storageController.retrieveAllItems()
        
        super.init()
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return Int(self.items.count)
    }
    
    func itemContentForIndexpath(indexPath: NSIndexPath) -> String {
        if let item = self.items.objectAtIndex(UInt(indexPath.row)) as? Item {
            return item.content
        }
        else {
            return NSLocalizedString("No content available.", comment: "noContent")
        }
    }
}