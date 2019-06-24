//
//  SubTitleWeatherCell.swift
//  WeatherForecast
//
//  Created by Jeon-heaji on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class SubTitleWeatherCell: UITableViewCell {
    
    @IBOutlet weak var tcLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var view: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.contentView.layer.cornerRadius = 5
        self.separatorInset = UIEdgeInsets(top: 0, left: frame.width + frame.width, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
