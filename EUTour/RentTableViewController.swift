//
//  RentTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/12/3.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class RentTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverControllerDelegate {
    
    var list:NSMutableArray? = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Stuttgart"
        
        var mapItem:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "map_icon"), style: .Plain, target: self, action: nil)
        var filterItem:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter_icon"), style: .Plain, target: self, action: nil)
        var rightButtonItems:NSArray = [mapItem, filterItem]
        self.navigationItem.setRightBarButtonItems(rightButtonItems, animated: true)
        self.getData()
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
        return self.list!.count
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: RentListTableViewCell = tableView.dequeueReusableCellWithIdentifier("rentList", forIndexPath: indexPath) as RentListTableViewCell
        cell.houseTypeLabel.text = self.list?[indexPath.row]["room_type"] as? String
        let price:Int? = self.list?[indexPath.row]["price"] as? Int
        if ((price) != nil) {
            cell.housePrice.text = String(price!)
        }
        cell.houseImage.image = UIImage(named: "house1")
        cell.houseTitle.text = self.list?[indexPath.row]["title"] as? String
        cell.houseDetails.text = self.list?[indexPath.row]["desc"] as? String
        cell.houseDistance.text = "2.1 km"
        //cell.setCell("WG", imageName: "")
    
        /*
        var err: NSError?
        let data:NSData? = self.list?[indexPath.row]["images"] as? NSData
        var images_array = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
        if (err != nil) {
            println("JSON Error \(err!.localizedDescription)")
        }
        01
        println(images_array)
        
        
        
        let test:String? = self.list?[indexPath.row]["images"] as? String
        //println(test)
        
        let base64String:String? = nil
        //println(base64String)
        if (base64String != nil) {
            let decodedData = NSData(base64EncodedString: base64String!, options: NSDataBase64DecodingOptions(rawValue: 0))
            cell.houseImage.image = UIImage(data: decodedData!)
        } else {
            cell.houseImage.image = UIImage(named: "house1")
        }
        */
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(FilterTableViewController(), animated: true)
    }
    */

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
    
    func callFilterTableView() {
        
    }
    
    func getData() {
        let manager = AFHTTPRequestOperationManager()
        let url = "http://192.168.1.120:3000/immovables/all_immovables"
        manager.GET(url, parameters: nil,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                self.list = responseObject as? NSMutableArray
                self.tableView.reloadData()
            }, failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in println("ERROR: " + error.localizedDescription)
        })

    }
}
