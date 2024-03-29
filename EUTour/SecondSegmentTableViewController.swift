//
//  SecondSegmentTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/21.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class SecondSegmentTableViewController: UITableViewController {

    var data:NSArray? = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let manager = AFHTTPRequestOperationManager()
        let url = "http://37.187.71.48:3000/articles/all_articles"
        
        manager.GET(url, parameters: nil,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println(responseObject as? NSArray)
                self.data = responseObject as? NSArray
                self.tableView.reloadData()
            }, failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in println("ERROR: " + error.localizedDescription)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:articlesTableCellView? = tableView.dequeueReusableCellWithIdentifier("articlesTableView", forIndexPath: indexPath) as? articlesTableCellView
        
        if (cell == nil)
        {
            return cell!
        }
        
        cell!.titleLabel?.text = data![indexPath.row]["title"] as? String
        cell!.thumbnail?.image = UIImage(named:"BBS")
        cell!.contentLabel?.text = data![indexPath.row]["content"] as? String
        cell!.authButton?.setTitle("Li, Yuan", forState: UIControlState.Normal)//data![indexPath.row]["user_id"] as? NSInteger
        return cell!
    }
    
    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
