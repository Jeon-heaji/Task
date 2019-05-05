//
//  SliderV.swift
//  20190430NotificationUISlider
//
//  Created by Jeon-heaji on 04/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SliderView: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    init(frame: CGRect , name: String, tag: Int) {
        super.init(frame: frame)
        self.frame = frame
        
        self.label.text = name
        self.slider.tag = tag
        
        self.addSubview(label)
        self.addSubview(slider)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.widthAnchor.constraint(equalToConstant: 50),
            
            slider.topAnchor.constraint(equalTo: self.topAnchor),
            slider.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            slider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            slider.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

