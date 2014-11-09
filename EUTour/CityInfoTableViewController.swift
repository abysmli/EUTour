//
//  CityInfoTableViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/14.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit
import CoreLocation

class CityInfoTableViewController: UIViewController, TQTableViewDataSource, TQTableViewDelegate {
    
    
    var mTableView:TQMultistageTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "城市信息"

        println("cityinfoview")
        
        
        self.mTableView = TQMultistageTableView(frame: CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height-65))
        self.mTableView!.delegate = self;
        self.mTableView!.dataSource = self;
        self.view.addSubview(self.mTableView!)

        
        //self.list = [self listGenerator:[self sampleGenerator]];
        // Do any additional setup after loading the view.
    }
    
    func mTableView(mTableView: TQMultistageTableView, numberOfRowsInSection section: NSInteger) -> NSInteger {
        return 10;
    }
    
    func mTableView(mTableView: TQMultistageTableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cellIdentifier: String = "TQMultistageTableViewCell"
        var cell: UITableViewCell? = mTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        var view = UIView(frame: cell!.bounds)
        
        //UIView *view = [[UIView alloc] initWithFrame:cell.bounds] ;
        
        view.layer.backgroundColor = UIColor(red:246/255.0, green:213/255.0, blue:105/255.0, alpha:1).CGColor
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red:250/255.0, green:77/255.0, blue:83/255.0, alpha:1).CGColor
    
        cell!.backgroundView = view
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell!
    }
    
    func numberOfSectionsInTableView(mTableView: TQMultistageTableView) -> NSInteger {
        return 20;
    }
    
    func mTableView(mTableView: TQMultistageTableView, heightForHeaderInSection section: NSInteger) -> CGFloat {
        return 44;
    }
    
    func mTableView(mTableView: TQMultistageTableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66;
    }
    
    func mTableView(mTableView: TQMultistageTableView, heightForAtomAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100;
    }
    
    func mTableView(mTableView: TQMultistageTableView, viewForHeaderInSection section: NSInteger) -> UIView {
        let header = UIView()
    
        header.layer.backgroundColor = UIColor(red:218/255.0, green:249/255.0, blue:255/255.0, alpha:1).CGColor
        header.layer.masksToBounds = true
        header.layer.borderWidth  = 0.5
        header.layer.borderColor = UIColor(red:179/255.0, green:143/255.0, blue:195/255.0, alpha:1).CGColor
        
        return header
    }
    
    func mTableView(mTable: TQMultistageTableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("didSelectRow \(indexPath.row)")
    }
    
    //pragma mark - Header Open Or Close
    
    func mTableView(mTableView: TQMultistageTableView, willOpenHeaderAtSection section: NSInteger) {
        println("Open Header \(section)")
    }
    
    func mTableView(mTableView: TQMultistageTableView, willCloseHeaderAtSection section: NSInteger) {
        println("Close Header \(section)")
    }
    
    //pragma mark - Row Open Or Close
    
    func mTableView(mTableView: TQMultistageTableView, willOpenRowAtIndexPath indexPath: NSIndexPath) {
        println("Open Row \(indexPath.row)")
    }
    
    func mTableView(mTableView: TQMultistageTableView, willCloseRowAtIndexPath indexPath: NSIndexPath) {
        println("Close Row \(indexPath.row)")
    }
}
