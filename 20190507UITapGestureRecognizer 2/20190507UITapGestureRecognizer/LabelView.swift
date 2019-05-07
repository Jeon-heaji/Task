//
//  LabelView.swift
//  20190507UITapGestureRecognizer
//
//  Created by Jeon-heaji on 07/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class LabelView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
     init(frame: CGRect, name: String) {
        super.init(frame: frame)
        self.label.text = name
        self.addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
     
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
