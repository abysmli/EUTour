//
//  HomePageViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/11.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit
import CoreLocation

// MARK: 子版块配色

extension UIColor {
    class func applicationRentInfoColor() -> UIColor {
        return UIColor(red: 96/255, green: 209/255, blue: 68/255, alpha: 1)
    }
    
    class func applicationNewsColor() -> UIColor {
        return UIColor(red: 249/255, green: 84/255, blue: 89/255, alpha: 1)
    }
    
    class func applicationCityInfoColor() -> UIColor {
        return UIColor(red: 189/255, green: 65/255, blue: 190/255, alpha: 1)
    }
    
    class func applicaitonUniColor() -> UIColor {
        return UIColor(red: 255/255, green: 142/255, blue: 78/255, alpha: 1)
    }
}

class HomePageViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var current_rate_title: UILabel!
    @IBOutlet weak var current_rate: UILabel!

    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weathericon: UIImageView!
    
    @IBOutlet weak var LocationLabel: UIBarButtonItem!
    
    
    let locationManger:CLLocationManager = CLLocationManager()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //定位功能初始化
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        
        //更新汇率
        updateExchangeRate()
    }
    
    
    // MARK: Localize
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        //地址反编码
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
   
            if (error != nil) {
                //println("Reverse geocoder failed with error:" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                self.locationManger.stopUpdatingLocation()
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
            }else {
                //println("Error with data")
            }
        })
        
        var location:CLLocation = locations[locations.count-1] as CLLocation
        if location.horizontalAccuracy > 0 {
            //println(location.coordinate.latitude)
            //println(location.coordinate.longitude)
            //updateWeatherInfo(location.coordinate.latitude, longtitude: location.coordinate.longitude)
            locationManger.stopUpdatingLocation()
        }
        
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        
        self.locationManger.stopUpdatingLocation()
        self.LocationLabel.title = placemark.locality
        //println(placemark.locality)
        //println(placemark.postalCode)
        //println(placemark.administrativeArea)
        //println(placemark.country)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        //println("Error while updating location" + error.localizedDescription)
    }
    
    // MARK: Exchange Rate
    
    func updateExchangeRate() {
        let manager = AFHTTPRequestOperationManager()
        let url = "http://rate-exchange.appspot.com/currency?from=EUR&to=CNY"
        
        manager.GET(url, parameters: nil,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                //println("JSON: " + responseObject.description!)
                self.updateExchangeRateSuccess(responseObject as NSDictionary)
            }, failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in println("ExchangeRate Network ERROR: " + error.localizedDescription)
        })
    }
    
    func updateExchangeRateSuccess(jsonResult:NSDictionary!) {
        
        if let exchangerate = (jsonResult["from"] as? String) {
            var rate = jsonResult["rate"] as NSNumber
            self.current_rate.text = "\(rate)"
        }
    }
    
    
    // MARK: WEATHER
    
    func updateWeatherInfo(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) {
        let manager = AFHTTPRequestOperationManager()
        let url = "http://openweathermap.org/data/2.5/weather"
        
        let params = ["lat":latitude, "lon":longtitude, "cnt":0]
        
        manager.GET(url, parameters: params,
            success: {
            (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in println("JSON: " + responseObject.description!)
                self.updateUISuccess(responseObject as NSDictionary)
            }, failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in println("Weather Info Network ERROR: " + error.localizedDescription)
        })
    }
    
    func updateWeatherIcon(condition: Int, nightTime: Bool) {
        /*
        // Thunderstorm
        if condition < 300 {
            if (nightTime) {
                self.weathericon.image = UIImage(named: "thunderstorm-moon")
            } else {
                self.weathericon.image = UIImage(named: "thunderstorm-sun")
            }
        }
        
        // Drizzle
        else if condition < 500 {
            nightTime ? (self.weathericon.image = UIImage(named: "drizzle-moon")) : (self.weathericon.image = UIImage(named: "drizzle-sun"))
        }
        
        // Rain
        else if condition < 600 {
            nightTime ? (self.weathericon.image = UIImage(named: "rain-moon")) : (self.weathericon.image = UIImage(named: "rain-sun"))
        }
        
        // Snow
        else if condition < 700 {
            nightTime ? (self.weathericon.image = UIImage(named: "snow-moon")) : (self.weathericon.image = UIImage(named: "snow-sun"))
        }
        
        // Atmosphere
        else if condition < 800 {
            nightTime ? (self.weathericon.image = UIImage(named: "701-781fog_night")) : (self.weathericon.image = UIImage(named: "701-781fog_day"))
        }
        
        // Clear day
        else if condition < 803 {
            nightTime ? (self.weathericon.image = UIImage(named: "clear-day-moon")) : (self.weathericon.image = UIImage(named: "clear-day-sun"))
        }
        
        // Overcasts clouds
        else if condition < 900 {
            nightTime ? (self.weathericon.image = UIImage(named: "cloud-moon"))  : (self.weathericon.image = UIImage(named: "cloud-sun"))
        }
        
        // Tornado
        else if condition < 903 {
            self.weathericon.image = UIImage(named: "tornado")
        }
        
        // Cold
        else if condition == 903 {
            self.weathericon.image = UIImage(named: "cold")
        }
        
        // Hot
        else if condition == 904 {
            self.weathericon.image = UIImage(named: "hot")
        }
        
        // Windy
        else if condition == 905 {
            self.weathericon.image = UIImage(named: "windy")
        }
        
        // Hail
        else if condition == 906 {
            self.weathericon.image = UIImage(named: "hail")
        }
        */
    }
    
    func updateUISuccess(jsonResult:NSDictionary!) {
        if let tempresult = ((jsonResult["main"]? as NSDictionary)["temp"] as? Double) {
            var temperature: Int
            if let sys = (jsonResult["sys"]? as? NSDictionary) {
                
                temperature = Int(round(tempresult - 273.15))
        
                
                self.temperature.text = "\(temperature)°"
                
                if let weather = jsonResult["weather"]? as? NSArray {
                    var condition = (weather[0] as NSDictionary)["id"] as Int
                    var sunrise = sys["sunrise"] as Double
                    var sunset = sys["sunset"] as Double
                    var nightTime = false
                    var now = NSDate().timeIntervalSince1970
                    
                    if now < sunrise || now > sunset {
                        nightTime = true
                    }
                    self.updateWeatherIcon(condition, nightTime: nightTime)
                    return
                }
            }
        }
    }
    
}
