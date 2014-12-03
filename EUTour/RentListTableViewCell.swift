//
//  RentListTableViewCell.swift
//  EUTour
//
//  Created by Nan on 14/12/3.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit
import QuartzCore

class RentListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var houseTypeBackgroundView: UIView!
    @IBOutlet weak var houseTypeLabel: UILabel!
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseTitle: UILabel!
    @IBOutlet weak var houseDetails: UILabel!
    @IBOutlet weak var houseDistance: UILabel!
    @IBOutlet weak var housePrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // UI配置
        
        houseTypeLabel.textColor = UIColor.whiteColor()
        houseTypeLabel.font = UIFont(name: "Helvetica-Bold", size: 12)
        
        roundBorderCorners(houseTypeBackgroundView, radius: 3.0)
        houseTypeBackgroundView.backgroundColor = UIColor.customGray()
        
        houseImage.layer.cornerRadius = 2.0
        houseImage.layer.masksToBounds = true
        
        houseDetails.textColor = UIColor.lightGrayColor()
        houseDistance.textColor = UIColor.lightGrayColor()
        housePrice.textColor = UIColor.applicationRentInfoColor()
        // Configure the view for the selected state
    }
    
    func roundBorderCorners(currentView:UIView, radius: CGFloat) {
        var maskPath: UIBezierPath = UIBezierPath(roundedRect: currentView.bounds, byRoundingCorners: (UIRectCorner.BottomLeft | UIRectCorner.BottomRight), cornerRadii: CGSizeMake(radius, radius))
        var maskLayer:CAShapeLayer = CAShapeLayer(layer: currentView.layer)
        maskLayer.frame = currentView.bounds
        maskLayer.path = maskPath.CGPath
        
        currentView.layer.mask = maskLayer
        /*
        //设置边框
        var frameLayer:CAShapeLayer = CAShapeLayer(layer: layer)
        frameLayer.frame = bounds
        frameLayer.path = maskPath.CGPath
        frameLayer.strokeColor = UIColor.blackColor().CGColor
        frameLayer.fillColor = nil
        
        self.layer.addSublayer(frameLayer)
        */
    }
    /*
    func setCell(houseType: String, imageName: String) {
        self.houseTypeBackgroundView.text = houseType
        self.houseImage.image = UIImage(named: imageName)
    }
*/
}
