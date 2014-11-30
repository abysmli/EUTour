//
//  NewsViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/19.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var ViewChange: UIToolbar!
    
    @IBOutlet weak var TableViewContainer: UIView!
    
    @IBOutlet weak var ChangeTableViewSegment: UISegmentedControl!
    
    var newstableview:FirstSegmentTableViewController? = FirstSegmentTableViewController()
    var articlestableview:SecondSegmentTableViewController? = SecondSegmentTableViewController()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.findHairlineImageViewUnder(navigationController?.navigationBar)?.hidden = true
        changeFontColorOnView()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.findHairlineImageViewUnder(navigationController?.navigationBar)?.hidden = false
        self.navigationController?.navigationBar.tintColor = nil
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "时事资讯"
        
        addBottomBorder()
        
        newstableview = self.storyboard?.instantiateViewControllerWithIdentifier("newsTableView") as? FirstSegmentTableViewController
        articlestableview = self.storyboard?.instantiateViewControllerWithIdentifier("articlesTableView") as? SecondSegmentTableViewController
        
        ChangeTableViewSegment.selectedSegmentIndex = 0
        ChangeTableViewSegment.addTarget(self, action: "selectedSegmentDidChange:", forControlEvents: .ValueChanged)
        
        self.addChildViewController(newstableview!)
        self.addChildViewController(articlestableview!)
        TableViewContainer.addSubview(newstableview!.view)
        

    }
    
    func selectedSegmentDidChange(segmentedControl: UISegmentedControl){
        
        
        var vc:UITableViewController? = UITableViewController()
        
        let index = ChangeTableViewSegment.selectedSegmentIndex

        
        switch ChangeTableViewSegment.selectedSegmentIndex {
        case 0 :
            articlestableview?.removeFromParentViewController()
            TableViewContainer.addSubview(newstableview!.view)
        case 1 :
            newstableview?.removeFromParentViewController()
            TableViewContainer.addSubview(articlestableview!.view)
        default:
            println("impossible")
        }
    }
    
    //去掉导航栏下面的线
    
    func findHairlineImageViewUnder(view:UIView!) -> UIView? {
        if  view is UIImageView && view.bounds.size.height <= 1.0 {
            return view
        }
        
        for subview in view.subviews as [UIView] {
            if let foundView = self.findHairlineImageViewUnder(subview) {
                return foundView
            }
        }
        return nil
    }
    
    
    // MARK: UI初始化
    
    func changeFontColorOnView() {
        //定义变量
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.applicationNewsColor()]
        
        //改变颜色
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        self.navigationController?.navigationBar.tintColor = UIColor.applicationNewsColor()
        self.ViewChange.tintColor = UIColor.applicationNewsColor()
    }
    
    //在segment下面添加细线
    func addBottomBorder() {
        var bottomBorder = CALayer()
        var toolbar_height = self.ViewChange.frame.size.height-0.5
        var toolbar_width = self.ViewChange.frame.size.width
        bottomBorder.frame = CGRectMake(0.0, toolbar_height, toolbar_width, 0.5)
        bottomBorder.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5).CGColor
        self.ViewChange.layer.addSublayer(bottomBorder)
    }
    
}
