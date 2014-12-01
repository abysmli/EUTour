//
//  CityInfoViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/11.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CityInfoViewController: UIViewController, CLLocationManagerDelegate {

    
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
    let locationManger:CLLocationManager = CLLocationManager()
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
        let destination_location:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: _latitude, longitude: _longitude), span: MKCoordinateSpanMake(0.005, 0.005))
        
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
        
        self.navigationItem.rightBarButtonItem = navigation_logo
        //self.view.viewWithTag(2)?.removeFromSuperview()
        
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.applicationCityInfoColor()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.BackgroundView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+64)
    }
    
    // 导航部分
    
    var navigation_logo: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "navigation_arrow"),style: .Plain, target: self, action: "callNavigation")
    }
    
    
    func callNavigation() {
        let cancelButtonTitle = NSLocalizedString("取消", comment: "OK")
        let navigation_apple = NSLocalizedString("苹果地图", comment: "")
        let navigation_google = NSLocalizedString("谷歌地图", comment: "")
        
        var alertController: UIAlertController = UIAlertController(title: "请选择要使用的地图", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var appleMapAction: UIAlertAction = UIAlertAction(title: navigation_apple, style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) in self.callAppleMap()
        })
        
        var googleMapAction: UIAlertAction = UIAlertAction(title: navigation_google, style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) in self.callGoogleMap()
        })
        
        var cancelAction: UIAlertAction = UIAlertAction(title: cancelButtonTitle, style: UIAlertActionStyle.Cancel, handler: {
            (action: UIAlertAction!) in println("\(action.title)")
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(appleMapAction)
        
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string: "comgooglemaps://")!)) {
            alertController.addAction(googleMapAction)
        }
        
        
        self.presentViewController(alertController, animated: true, completion: { println("Alert showed")
        })
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var location:CLLocation = locations[locations.count-1] as CLLocation
        if location.horizontalAccuracy > 0 {
            locationManger.stopUpdatingLocation()
        }
    }
    
    func callAppleMap() {
        self.locationManger.stopUpdatingLocation()
        var latitude = locationManger.location.coordinate.latitude
        var longitude = locationManger.location.coordinate.longitude
        UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/?saddr=\(latitude),\(longitude)&daddr=\(_latitude),\(_longitude)")!)
    }
    
    func callGoogleMap() {
        self.locationManger.stopUpdatingLocation()
        var latitude = locationManger.location.coordinate.latitude
        var longitude = locationManger.location.coordinate.longitude
        UIApplication.sharedApplication().openURL(NSURL(string: "comgooglemaps://?saddr=\(latitude),\(longitude)&daddr=\(_latitude),\(_longitude)")!)
    }

}
