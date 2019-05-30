//
//  CustomCell.swift
//  CollectionViewExample
//
//  Created by giftbot on 29/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        clipsToBounds = true        // 밖으로 나오는 부분을 잘라줌
        layer.cornerRadius = 20
        // imageView
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        
        
        // titleLabel
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        contentView.addSubview(titleLabel)
        
    }
    
    private func setupConstraints() {
        [imageView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            ])
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    // MARK: Configure Cell
    // 이 메서드에만 접근 가능
    func configure(image: UIImage?, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
    
}
