//
//  CityInforTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/14.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class CityInfoTableViewController: UITableViewController{
    
    
    
    var myData_ChineseTitle:Array<String> = ["外国人管理局","德意志银行","德国邮政","AOK保险公司"]
    var myData_DeutschTitle:Array<String> = ["Ausländerbehörde","Deutsche Bank","Deutsche Post","AOK Krankenversicherung"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.mTableView.delegate = self
        //self.mTableView.dataSource = self
        
    }

    // MARK: - UITableView Datasource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myData_ChineseTitle.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menu", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = self.myData_ChineseTitle[indexPath.row]
        cell.textLabel
        cell.detailTextLabel?.text = self.myData_DeutschTitle[indexPath.row]
        cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
        
        return cell
    }
    
    
    



}
