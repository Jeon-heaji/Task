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
        // Button
        amountButton.setImage(buttonImage, for: .normal)
        amountButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
       
        //  imageView
        imgView.contentMode = .scaleAspectFit
        
        // addSubView -> AutoLayout할때는 addSubView를 먼저해야함
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
        // autoLayout
        // Button
        amountButton.translatesAutoresizingMaskIntoConstraints = false
        amountButton.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
        amountButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        amountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 320).isActive = true
        
        // imgView
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        imgView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgView.widthAnchor.constraint(equalTo: contentView.heightAnchor,constant: 30).isActive = true
        imgView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        
        // iPhoneLabel
        iPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        iPhoneLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 5).isActive = true
        iPhoneLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        iPhoneLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        iPhoneLabel.widthAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 2).isActive = true
        
        // countLabel
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        countLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        countLabel.trailingAnchor.constraint(equalTo: amountButton.leadingAnchor, constant: 10).isActive = true

    }
}
