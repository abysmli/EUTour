//
//  RentTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/12/3.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class RentTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Stuttgart"
        
        var mapItem:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "map_icon"), style: .Plain, target: self, action: nil)
        var filterItem:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter_icon"), style: .Plain, target: self, action: nil)
        var rightButtonItems:NSArray = [mapItem, filterItem]
        self.navigationItem.setRightBarButtonItems(rightButtonItems, animated: true)
        //filterItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, -30)
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 4
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: RentListTableViewCell = tableView.dequeueReusableCellWithIdentifier("rentList", forIndexPath: indexPath) as RentListTableViewCell
        cell.houseTypeLabel.text = "单间"
        cell.houseImage.image = UIImage(named: "house1")
        cell.housePrice.text = "300"
        cell.houseTitle.text = "斯图Vahingen宿舍出租"
        cell.houseDetails.text = "学生宿舍，在Uni Vahingen校区内，公用厨房卫生间，环境优美，交通便利，并有100兆带宽的高速网络"
        cell.houseDistance.text = "2.1 km"
        //cell.setCell("WG", imageName: "")
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }

    override func viewWillAppear(animated: Bool) {
        //定义变量
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.darkGrayColor()]
        
        //改变颜色
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        self.navigationController?.navigationBar.tintColor = UIColor.applicationRentInfoColor()
        self.navigationController?.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.tintColor = nil
    }

}
