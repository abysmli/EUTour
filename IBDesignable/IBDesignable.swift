//
//  IBDesignable.swift
//  EUTour
//
//  Created by Nan on 14/8/11.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

@IBDesignable class IBDesignable: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
