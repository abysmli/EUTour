//
//  newsTableCellView.swift
//  EUTour
//
//  Created by AbysmLi on 11/18/14.
//  Copyright (c) 2014 Nan. All rights reserved.
//

import UIKit

class newsTableCellView: UITableViewCell {
    
    @IBOutlet weak var thumbnail : UIImageView?
    @IBOutlet weak var titleLabel : UILabel?
    @IBOutlet weak var contentLabel : UILabel?
    @IBOutlet weak var posttimeLabel : UILabel?
    @IBOutlet weak var reviewsLabel : UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
