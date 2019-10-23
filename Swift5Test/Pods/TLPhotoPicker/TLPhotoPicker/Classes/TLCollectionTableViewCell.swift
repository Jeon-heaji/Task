//
//  TLCollectionTableViewCell.swift
//  TLPhotosPicker
//
//  Created by wade.hawk on 2017. 5. 3..
//  Copyright © 2017년 wade.hawk. All rights reserved.
//

import UIKit

open class TLCollectionTableViewCell: UITableViewCell {
    @IBOutlet open var thumbImageView: UIImageView!
    @IBOutlet open var titleLabel: UILabel!
    @IBOutlet open var subTitleLabel: UILabel!
    
    override open func awakeFromNib() {
        super.awakeFromNib()   
        if #available(iOS 11.0, *) {
            self.thumbImageView.accessibilityIgnoresInvertColors = true
        }
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            let userInterfaceStyle = self.traitCollection.userInterfaceStyle
            if userInterfaceStyle.rawValue == 2 {
                self.contentView.backgroundColor = .systemBackground
            }else {
                self.contentView.backgroundColor = .white
            }
        }
    }
}
