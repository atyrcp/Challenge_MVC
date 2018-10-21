//
//  RandomImageTableViewCell.swift
//  Challenge_MVC
//
//  Created by z on 2018/10/18.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class RandomImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var randomImageView: UIImageView!
    
    func displayImage(from data: UIImage) {
        randomImageView.image = data
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
