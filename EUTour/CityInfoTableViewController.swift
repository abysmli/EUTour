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
    var list:NSMutableArray? = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = AFHTTPRequestOperationManager()
        let url = "http://192.168.1.120:3000/cityinfos/all_cityinfos"
        
        manager.GET(url, parameters: nil,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println(responseObject as NSArray)
                self.list = self.listGenerator(responseObject as NSArray)
                self.mTableView?.reloadData()
            }, failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in println("ERROR: " + error.localizedDescription)
        })
        
        self.mTableView = TQMultistageTableView(frame: self.view.bounds)
        self.mTableView!.delegate = self
        self.mTableView!.dataSource = self
        self.view.addSubview(self.mTableView!)
        self.navigationItem.title = "城市信息"

        // Do any additional setup after loading the view.
    }
    
    func listGenerator(originlist: NSArray) -> NSMutableArray {
        var flag:Bool = false
        var newlist:NSMutableArray = NSMutableArray()
        for (_row) in originlist {
            for (dict) in newlist {
                if (dict["title"] as String == _row["title"] as String) {
                    let sub_dict:NSDictionary = ["sub_title"        :   _row["sub_title"] as String,
                        "station_type"     :   _row["station_type"] as Int,
                        "station"          :   _row["station"] as String,
                        "longitude"        :   _row["longitude"] as String,
                        "latitude"         :   _row["latitude"] as String,
                        "opentime1"        :   _row["opentime1"] as String,
                        "opentime2"        :   _row["opentime2"] as String,
                        "address"          :   _row["details"] as String,
                        "email"            :   _row["email"] as String,
                        "phonenumber"      :   _row["tel"] as String,
                        "website"          :   _row["url"] as String]
                    (dict["details"] as NSMutableArray).addObject(sub_dict)
                    flag = true
                }
            }
            if !flag {
                let sub_dict:NSDictionary = ["sub_title"        :   _row["sub_title"] as String,
                    "station_type"     :   _row["station_type"] as Int,
                    "station"          :   _row["station"] as String,
                    "longitude"        :   _row["longitude"] as String,
                    "latitude"         :   _row["latitude"] as String,
                    "opentime1"       :   _row["opentime1"] as String,
                    "opentime2"       :   _row["opentime2"] as String,
                    "address"          :   _row["details"] as String,
                    "email"            :   _row["email"] as String,
                    "phonenumber"      :   _row["tel"] as String,
                    "website"          :   _row["url"] as String]
                let sub_array:NSMutableArray = NSMutableArray(object: sub_dict)
                var dict:NSDictionary = ["title"        :   _row["title"] as String,
                    "name"         :   _row["name"] as String,
                    "details"      :   sub_array]
                newlist.addObject(dict)
            }
            flag = false
        }
        return newlist
    }
    
    func numberOfSectionsInTableView(mTableView: TQMultistageTableView) -> NSInteger {
        if (self.list? != nil) {
            return self.list!.count
        } else {
            return 0
        }
    }
    
    func mTableView(mTableView: TQMultistageTableView, numberOfRowsInSection section: NSInteger) -> NSInteger {
        if (self.list? != nil) {
            return (self.list![section]["details"] as NSMutableArray).count
        } else {
            return 0
        }
    }
    
    func mTableView(mTableView: TQMultistageTableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cellIdentifier: String = "TQMultistageTableViewCell"
        var cell: UITableViewCell? = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        
        var view = UIView(frame: cell!.bounds)
        cell!.backgroundView = view
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        
        let details:NSMutableArray = self.list?[indexPath.section]["details"] as NSMutableArray
        
        let separator_line:UIView = UIView(frame: CGRectMake(0, 85.5, mTableView.frame.size.width, 0.5))
        separator_line.backgroundColor = UIColor(red:184/255.0, green:198/255.0, blue:219/255.0, alpha:1.0)
        
        let label_title:UILabel = UILabel()
        label_title.textColor = UIColor.blackColor();
        label_title.frame = CGRectMake(19, 16, 150, 40);
        label_title.font = UIFont(name: "Arial", size: 15)
        label_title.text = details[indexPath.row]["sub_title"] as? String
        label_title.sizeToFit()
        
        let label_name:UILabel = UILabel()
        label_name.font = UIFont(name:"Arial", size:13.0)
        label_name.text = details[indexPath.row]["station"] as? String
        label_name.textColor = UIColor(red:181/255.0, green:181/255.0, blue:181/255.0, alpha:1.0)
        label_name.frame = CGRectMake(40, 40, 135, 40)
        label_name.sizeToFit()
        
        
        let current_location:CLLocation = CLLocation(latitude: 48.782233, longitude: 9.174193)
        let destination_location:CLLocation = CLLocation(latitude: (details[indexPath.row]["latitude"] as NSString).doubleValue, longitude: (details[indexPath.row]["longitude"] as NSString).doubleValue)
        let label_distance:UILabel = UILabel()
        label_distance.textColor = UIColor(red:181/255.0, green:181/255.0, blue:181/255.0, alpha:1.0)
        label_distance.frame = CGRectMake(37, 62, 150, 40)
        label_distance.font = UIFont(name:"Arial", size:13.0)
        let distance = current_location.distanceFromLocation(destination_location)/1000
        label_distance.text = NSString(format: "%.2fkm", distance)
        label_distance.sizeToFit()
        
        
        let label_opentime_weekdays:UILabel = UILabel()
        label_opentime_weekdays.font = UIFont(name:"Arial", size:13.0)
        label_opentime_weekdays.text = details[indexPath.row]["opentime1"] as? String
        label_opentime_weekdays.textColor = UIColor(red:181/255.0, green:181/255.0, blue:181/255.0, alpha:1.0)
        label_opentime_weekdays.frame = CGRectMake(158, 20, 150, 40)
        label_opentime_weekdays.numberOfLines = 4
        label_opentime_weekdays.sizeToFit()
        
        
        let label_opentime_time:UILabel = UILabel()
        label_opentime_time.font = UIFont(name:"Arial", size:13.0)
        label_opentime_time.text = details[indexPath.row]["opentime2"] as? String
        label_opentime_time.textColor = UIColor(red:181/255.0, green:181/255.0, blue:181/255.0, alpha:1.0)
        label_opentime_time.frame = CGRectMake(218, 20, 150, 40)
        label_opentime_time.numberOfLines = 4
        label_opentime_time.sizeToFit()
        
        var station_icon:UIImage = UIImage()
        
        if (details[indexPath.row]["station_type"] as? Int == 1) {
            station_icon = UIImage(named: "Sbahn_logo")!
        } else {
            station_icon = UIImage(named: "Ubahn_logo")!
        }
        
        let station_icon_block:UIImageView = UIImageView(image: station_icon)
        station_icon_block.frame = CGRectMake(19, 40, 15, 15)
        
        var location_icon:UIImage = UIImage()
        location_icon = UIImage(named: "location_icon")!
        let location_icon_block:UIImageView = UIImageView(image: location_icon)
        location_icon_block.frame = CGRectMake(19, 62, 15, 15)

        cell!.addSubview(label_name)
        cell!.addSubview(label_title)
        cell!.addSubview(label_distance)
        cell!.addSubview(label_opentime_weekdays)
        cell!.addSubview(label_opentime_time)
        cell!.addSubview(station_icon_block)
        cell!.addSubview(location_icon_block)
        cell!.addSubview(separator_line)
        
        return cell!
    }
    
    func mTableView(mTableView: TQMultistageTableView, viewForHeaderInSection section: NSInteger) -> UIView {
        let control:UIView = UIView()
        control.backgroundColor = UIColor.whiteColor()
        
        let separator_line:UIView = UIView(frame: CGRectMake(0, 85.5, mTableView.frame.size.width, 0.5))
        separator_line.backgroundColor = UIColor(red:184/255.0, green:198/255.0, blue:219/255.0, alpha:1.0)
        
        let label_title:UILabel = UILabel()
        label_title.font = UIFont(name: "Arial", size: 15)
        label_title.text = self.list![section]["title"] as? String
        label_title.textColor = UIColor.blackColor();
        label_title.frame = CGRectMake(19, 23, 200, 40)
        
        let label_name:UILabel = UILabel()
        label_name.font = UIFont(name:"Arial", size:13.0)
        label_name.text = self.list![section]["name"] as? String
        label_name.textColor = UIColor(red:181/255.0, green:181/255.0, blue:181/255.0, alpha:1.0)
        label_name.frame = CGRectMake(19, 52, 200, 40)
        
        label_title.sizeToFit()
        label_name.sizeToFit()
        control.addSubview(label_title)
        control.addSubview(label_name)
        control.addSubview(separator_line)
        return control
    }

    
    func mTableView(mTableView: TQMultistageTableView, heightForHeaderInSection section: NSInteger) -> CGFloat {
        return 86;
    }
    
    func mTableView(mTableView: TQMultistageTableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 86;
    }
    
    func mTableView(mTableView: TQMultistageTableView, heightForAtomAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 86;
    }
    
    func mTableView(mTable: TQMultistageTableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dest_view:CityInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CityInfoDetailsView") as CityInfoViewController
        let details:NSMutableArray = self.list?[indexPath.section]["details"] as NSMutableArray
        dest_view._title = self.list![indexPath.section]["title"] as? String
        dest_view._subtitle = self.list![indexPath.section]["name"] as? String
        
        dest_view._opendate = details[indexPath.row]["opentime1"] as? String
        dest_view._opentime = details[indexPath.row]["opentime2"] as? String
        dest_view._latitude = (details[indexPath.row]["latitude"] as? NSString)!.doubleValue
        dest_view._longitude = (details[indexPath.row]["longitude"] as? NSString)!.doubleValue
        dest_view._address = details[indexPath.row]["details"] as? String
        dest_view._email = details[indexPath.row]["email"] as? String
        dest_view._phonenumber = details[indexPath.row]["tel"] as? String
        dest_view._website = details[indexPath.row]["url"] as? String
        dest_view._sbahn = details[indexPath.row]["station"] as? String
        dest_view._ubahn = details[indexPath.row]["station"] as? String
        
        self.navigationController?.pushViewController(dest_view, animated: true)
        
        /*
        CityInformation_DetailsViewController *dest_View = [self.storyboard instantiateViewControllerWithIdentifier:@"CityInformationDetailsViewController"];
        dest_View.mLocation = [[CLLocation alloc] initWithLatitude:[self.list[indexPath.section][@"details"][indexPath.row][@"latitude"] doubleValue] longitude:[self.list[indexPath.section][@"details"][indexPath.row][@"longitude"] doubleValue]];
        dest_View.mOpenTime_1 = [NSString stringWithFormat:@"%@",self.list[indexPath.section][@"details"][indexPath.row][@"opentime_1"]];
        dest_View.mOpenTime_2 = [NSString stringWithFormat:@"%@",self.list[indexPath.section][@"details"][indexPath.row][@"opentime_2"]];
        dest_View.mTitle = [NSString stringWithFormat:@"%@",self.list[indexPath.section][@"title"]];
        [self.navigationController pushViewController:dest_View animated:YES];
        */
    }
    
    /*
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
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "CityInfoDetailsView") {
            let dest_View:CityInfoViewController = segue.destinationViewController as CityInfoViewController
            dest_View.hidesBottomBarWhenPushed = true
        }
        
    }

    
}
