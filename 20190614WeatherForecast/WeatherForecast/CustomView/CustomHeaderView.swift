//
//  CustomHeaderView.swift
//  WeatherForecast
//
//  Created by Jeon-heaji on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        let backView = UIView()
        backView.backgroundColor = .clear
        self.backgroundView = backView
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
