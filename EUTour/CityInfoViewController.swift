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

    @IBOutlet weak var opendate: UILabel!
    @IBOutlet weak var opentime: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phonenumber: UILabel!
    @IBOutlet weak var sbahn: UILabel!
    @IBOutlet weak var ubahn: UILabel!
    
    @IBOutlet weak var mapview: MKMapView!
    
    
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
        
        
        
        mapview.showsUserLocation = true;
        let region:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: _latitude, longitude: _longitude), span: MKCoordinateSpanMake(0.01, 0.01))
        
        mapview.setRegion(region, animated: true)
        
        let ann:MKPointAnnotation = MKPointAnnotation()
        ann.coordinate = region.center
        ann.title = _title
        ann.subtitle = _subtitle

        mapview.addAnnotation(ann)
        opendate.text = _opendate
        opentime.text = _opentime
        phonenumber.text = _phonenumber;
        email.text = _email;
        website.text = _website;
        ubahn.text = _ubahn;
        sbahn.text = _sbahn;
        address.text = _address;

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
