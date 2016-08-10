//
//  ItemListDataSource.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class ItemListDataSource: NSObject {
    
    let viewModel: ItemListViewModel
    
    init(tableView: UITableView, viewModel: ItemListViewModel) {
        self.viewModel = viewModel
        super.init()
        tableView.dataSource = self
    }
}

extension ItemListDataSource: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = self.viewModel.itemContentForIndexpath(indexPath)
        return cell
    }
    
}
