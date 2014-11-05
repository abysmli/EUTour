//
//  SettingTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/13.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var actionMap: [[Void -> Void]] {
        return [
            // Alert style alerts.
            [
                self.clearthebuffer
            ],
            // Action sheet style alerts.
            [
            ],
            [
            ]
        ]
    }
    
    func clearthebuffer() {
        let title = NSLocalizedString("清空缓存", comment: "")
        let message = NSLocalizedString("此操作会清空在本机保存的缓存文件", comment: "")
        let cancelButtonTitle = NSLocalizedString("取消", comment: "")
        let otherButtonTitle = NSLocalizedString("确认", comment: "")
        
        let alertCotroller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) {
            action in NSLog("The \"Okay/Cancel\" alert's cancel action occured.")
        }
        
        let otherAction = UIAlertAction(title: otherButtonTitle, style: .Default) { action in
            NSLog("The \"Okay/Cancel\" alert's other action occured.")
        }
        
        // Add the actions
        
        alertCotroller.addAction(cancelAction)
        alertCotroller.addAction(otherAction)
        
        presentViewController(alertCotroller, animated: true, completion: nil)
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let action = actionMap[indexPath.section][indexPath.row]
        
        action()
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
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


