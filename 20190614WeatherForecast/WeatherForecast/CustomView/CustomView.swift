//
//  CustomView.swift
//  WeatherForecast
//
//  Created by Jeon-heaji on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
    func backgroundChange(reloadButton button: UIButton)
    
}
class CustomView: UIView {
    weak var delegate: CustomViewDelegate?
    
    let images = ["cloudy", "lightning", "rainy", "sunny"]
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Seoul"
        return label
    }()
    
    let currentTime: UILabel = {
        let label = UILabel()
        label.text = "오후 19:00"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let refreshBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(reloadData(_:)), for: .touchUpInside)
        button.setImage(UIImage(named: "refreshing"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        containerView.addSubview(cityLabel)
        containerView.addSubview(currentTime)
        containerView.addSubview(refreshBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            cityLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            currentTime.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            currentTime.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            refreshBtn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            refreshBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            refreshBtn.widthAnchor.constraint(equalToConstant: 40),
            
            ])
    }
    
    @objc func reloadData(_ sender: UIButton) {

        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
        spinAnimation.duration = 0.5
        spinAnimation.toValue = CGFloat.pi * 2
        sender.layer.add(spinAnimation, forKey: "spinAnimation")
        
        delegate?.backgroundChange(reloadButton: sender)
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
