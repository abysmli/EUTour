//
//  CityInforTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/14.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class CityInfoTableViewController: UITableViewController{
    
    // MARK: Types
    
    struct TableViewConstants {
        static let tableViewCellIdentifier = "menu"
    }
    
    // MARK: Properties
    
    var myData_ChineseTitle:Array<String> = ["外国人管理局","德意志银行","德国邮政","AOK保险公司"]
    var myData_DeutschTitle:Array<String> = ["Ausländerbehörde","Deutsche Bank","Deutsche Post","AOK Krankenversicherung"]
    
    lazy var visibleResults: [String] = self.myData_ChineseTitle
    
    /// A `nil` / empty filter string means show all results. Otherwise, show only results containing the filter.
    var filterString: String? = nil {
        didSet {
            if filterString == nil || filterString!.isEmpty {
                visibleResults = myData_ChineseTitle
            }
            else {
                // Filter the results using a predicate based on the filter string.
                let filterPredicate = NSPredicate(format: "SELF contains[c] %@", argumentArray: [filterString!])
                
                visibleResults = myData_ChineseTitle.filter { filterPredicate.evaluateWithObject($0) }
            }
            
            tableView.reloadData()
        }
    }

    
    
    // MARK: - UITableView Datasource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return visibleResults.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewConstants.tableViewCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = self.visibleResults[indexPath.row]
        cell.detailTextLabel?.text = self.myData_DeutschTitle[indexPath.row]
        cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
        
        return cell
    }
    

}
