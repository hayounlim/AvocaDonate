//
//  CustomTableViewCell.swift
//  searchbar4
//
//  Created by GEGWC8 on 8/3/16.
//  Copyright © 2016 GEGWC8. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let imgUser = UIImageView()
    let labUerName = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //imgUser.backgroundColor = UIColor.whiteColor()
        
        imgUser.translatesAutoresizingMaskIntoConstraints = false
        labUerName.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imgUser)
        contentView.addSubview(labUerName)
        
        let viewsDict = [
            "image" : imgUser,
            "username" : labUerName,
            ]
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[image(80)]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[username]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[username]-[image(80)]-|", options: [], metrics: nil, views: viewsDict))
    }
    
}