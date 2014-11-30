//
//  CityInfoViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/11.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit
import MapKit

class CityInfoViewController: UIViewController {

    
    @IBOutlet weak var opentime_title: UILabel!
    @IBOutlet weak var contact_title: UILabel!
    @IBOutlet weak var traffic_title: UILabel!
    @IBOutlet weak var address_title: UILabel!
    @IBOutlet weak var BackgroundView: UIScrollView!
    
    @IBOutlet weak var opendate: UILabel!
    @IBOutlet weak var opentime: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phonenumber: UILabel!
    @IBOutlet weak var sbahn: UILabel!
    @IBOutlet weak var ubahn: UILabel!
    
    @IBOutlet weak var mapview: MKMapView!
    
    //定义每个子项
    @IBOutlet weak var opentime_view: UIView!
    @IBOutlet weak var contact_view: UIView!
    @IBOutlet weak var traffic_view: UIView!
    @IBOutlet weak var address_view: UIView!
    
    var _title:String? = nil
    var _subtitle:String? = nil
    var _opendate:String? = nil
    var _opentime:String? = nil
    var _address:String? = nil
    var _website:String? = nil
    var _email:String? = nil
    var _phonenumber:String? = nil
    var _sbahn:String? = nil
    var _ubahn:String? = nil
    var _latitude:Double = 0.0
    var _longitude:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "外国人管理局"
        
        
        //地图配置
        
        mapview.showsUserLocation = true;
        let destination_location:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.772816, longitude: 9.177671), span: MKCoordinateSpanMake(0.005, 0.005))
        
        mapview.setRegion(destination_location, animated: true)
        
        let location_pin:MKPointAnnotation = MKPointAnnotation()
        location_pin.coordinate = destination_location.center
        location_pin.title = _title
        location_pin.subtitle = _subtitle

        mapview.addAnnotation(location_pin)
        opendate.text = _opendate
        opentime.text = _opentime
        phonenumber.text = _phonenumber;
        email.text = _email;
        website.text = _website;
        ubahn.text = _ubahn;
        sbahn.text = _sbahn;
        address.text = _address;
        
        //UI配置
        
        opentime_title.textColor = UIColor.applicationCityInfoColor()
        contact_title.textColor = UIColor.applicationCityInfoColor()
        traffic_title.textColor = UIColor.applicationCityInfoColor()
        address_title.textColor = UIColor.applicationCityInfoColor()
        self.navigationController?.navigationBar.tintColor = UIColor.applicationCityInfoColor()
        
        self.view.viewWithTag(2)?.removeFromSuperview()
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.applicationCityInfoColor()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.BackgroundView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+20)
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
