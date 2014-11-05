//
//  MeTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/12.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class MeTableViewController: UITableViewController {

    
    // MARK: 显示用户信息的控件
    
    @IBOutlet weak var user_image: UIImageView!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var user_residence: UILabel!
    @IBOutlet weak var user_sex: UIImageView!
    
    @IBAction func edit_userinfo(sender: AnyObject) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
