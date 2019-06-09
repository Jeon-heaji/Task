//
//  MusicTableViewCell.swift
//  ITunesAPIPractice
//
//  Created by Jeon-heaji on 08/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//
import UIKit

class MusicTableViewCell: UITableViewCell {
    static let identifire = "ITunesCell"
    
    let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        label.textColor = .darkGray
        label.text = "music"
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .darkGray
        label.text = "singer"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleImage)
        contentView.addSubview(subTitleLabel)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            titleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleImage.widthAnchor.constraint(equalTo: contentView.heightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 15),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 15),
            subTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            
            
            ])
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
