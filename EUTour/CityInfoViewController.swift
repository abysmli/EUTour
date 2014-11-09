//
//  CityInfoViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/11.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class CityInfoViewController: UIViewController {

    @IBOutlet weak var opendate: UILabel!
    @IBOutlet weak var opentime: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "外国人管理局"
        
        opendate.text = "Mo,Di,Mi\nDo\nFr"
        opentime.text = "08:30 - 13:00\n13:00 - 18:00\n08:30 - 12:00"
        address.text = "Eberhardstrasse 39\n70173 Stuttgart"
        println("cityinfoview")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
