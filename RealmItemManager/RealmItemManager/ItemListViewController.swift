//
//  ItemListViewController.swift
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    var mainDataSource: ItemListDataSource?
    var mainDelegate: ItemListDelegate?
    var mainViewModel: ItemListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainViewModel = ItemListViewModel()
        self.mainDataSource = ItemListDataSource(tableView: self.mainTableView, viewModel: self.mainViewModel!)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.mainTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
