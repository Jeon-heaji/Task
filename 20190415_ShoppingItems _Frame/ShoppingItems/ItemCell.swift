//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
    func aItemCell(_ itemCell: ItemCell, didTapButton button : UIButton)
}

final class ItemCell: UITableViewCell {
    
    let amountButton = UIButton(type: .custom)
    let imgView = UIImageView()
    let iPhoneLabel = UILabel()
    let countLabel = UILabel()
    let buttonImage: UIImage = UIImage(named: "add")!
    
    
    
    
    weak var delegate: ItemCellDelegate?
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // viewdidLoad
        configuration()
    }
    
    func configuration() {
        
        amountButton.setImage(buttonImage, for: .normal)
        amountButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        //  imageView
        imgView.contentMode = .scaleAspectFit
        
        // addSubView
        contentView.addSubview(amountButton)
        contentView.addSubview(imgView)
        contentView.addSubview(iPhoneLabel)
        contentView.addSubview(countLabel)
        
    }
    
    
    @objc func didTapButton(_ sender: UIButton) {
        delegate?.aItemCell(self, didTapButton: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        //frame
        amountButton.frame = CGRect(x: frame.width - 80, y: 18, width: 80, height: frame.height - 20)
        imgView.frame = CGRect(x: 0, y: 0, width: contentView.frame.height, height: contentView.frame.height)
        
        iPhoneLabel.frame = CGRect(x: imgView.frame.height + 10, y: (frame.height / 2 ) - 15, width: 200, height: 40)
        
        countLabel.frame = CGRect(x: frame.width - 100, y: (frame.height / 2 ) - 13, width: 70, height: 30)
    }
}
