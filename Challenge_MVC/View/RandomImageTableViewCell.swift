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
    
    @IBOutlet weak var phtographerNameLabel: UIButton!
    
    
    func displayOutLook(from image: UIImage, from data: RandomImage) {
        randomImageView.image = image
        phtographerNameLabel.setTitle(data.user.name, for: .normal)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
