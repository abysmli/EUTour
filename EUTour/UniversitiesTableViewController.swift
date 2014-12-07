//
//  UniversitiesTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/11/13.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class UniversitiesTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var universitiesTableView: UITableView!
    
    var uni_name_cn = ["综合讨论区","斯图加特大学","卡尔斯鲁厄大学","海德堡大学","曼海姆大学","图宾根大学","乌尔姆大学","康斯坦茨大学","弗莱堡大学"]
    var uni_name_de = ["大家一起来畅所欲言吧","Uni Stuttgart","Uni Karlsruhe","Uni Heidelberg","Uni Mannheim","Uni Tübingen","Uni Uulm","Uni Konstanz","Uni Freiburg"]
    var uni_logo = [UIImage(named: "BBS.png"),UIImage(named: "Uni Stuttgart.png"),UIImage(named: "Uni Karlsruhe.png"),UIImage(named: "Uni Heidelberg.png"),UIImage(named: "Uni Mannheim.png"),UIImage(named: "Uni Tübingen.png"),UIImage(named: "Uni Uulm.png"),UIImage(named: "Uni Konstanz.png"),UIImage(named: "Uni Freiburg")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.universitiesTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.universitiesTableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return uni_name_cn.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = universitiesTableView.dequeueReusableCellWithIdentifier("Uni", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = self.uni_name_cn[indexPath.row]
        cell.detailTextLabel?.text = self.uni_name_de[indexPath.row]
        cell.imageView?.image = self.uni_logo[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
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
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
