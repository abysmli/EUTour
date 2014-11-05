//
//  PostMenuTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/12.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class PostMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //将没有内容的cell用空的uiview填充，以此来隐藏没有内容的表单cell
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }


}
