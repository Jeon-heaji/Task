//
//  PopUpView.swift
//  YogiyoSample
//
//  Created by Jeon-heaji on 07/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//


import UIKit

class PopUpView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.translatesAutoresizingMaskIntoConstraints = false
        return pageController
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yogiyo4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yogiyo5")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dismissBtn: UIButton = {
        let dismissBtn = UIButton(type: .custom)
        dismissBtn.translatesAutoresizingMaskIntoConstraints = false
        dismissBtn.setImage(UIImage(named: "x"), for: .normal)
        dismissBtn.setTitleColor(.white, for: .normal)
        return dismissBtn
    }()
    
    let detailBtn: UIButton = {
        let detailBtn = UIButton()
        detailBtn.translatesAutoresizingMaskIntoConstraints = false
        detailBtn.setTitle("자세히보기", for: .normal)
        detailBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        detailBtn.setTitleColor(.white, for: .normal)
        detailBtn.backgroundColor = .lightGray
        detailBtn.addTarget(self, action: #selector(detailBtnAction(_:)), for: .touchUpInside)
        return detailBtn
    }()
    
    let checkBtn: UIButton = {
        let checkBtn = UIButton(type: .custom)
        checkBtn.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        checkBtn.translatesAutoresizingMaskIntoConstraints = false
        checkBtn.setImage(UIImage(named: "check1"), for: .normal)
        checkBtn.setImage(UIImage(named: "check2"), for: .selected)
        return checkBtn
    }()
    
    let todayButton: UIButton = {
        let todayButton = UIButton()
        todayButton.translatesAutoresizingMaskIntoConstraints = false
        todayButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        todayButton.setTitle("오늘하루그만보기", for: .normal)
        todayButton.setTitleColor(.darkGray, for: .normal)
        
        return todayButton
    }()
    
    var isSelectedImg = false
    let userD = UserDefaults.standard
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(scrollView)
        
        self.scrollView.addSubview(imageView)
        self.scrollView.addSubview(secondImageView)
        self.addSubview(pageController)
        self.addSubview(dismissBtn)
        self.addSubview(detailBtn)
        self.addSubview(checkBtn)
        self.addSubview(todayButton)
        
        scrollView.alwaysBounceHorizontal = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1),
            
            secondImageView.topAnchor.constraint(equalTo: imageView.topAnchor),
            secondImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            secondImageView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            secondImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            secondImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1),
            
            pageController.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            pageController.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            
            checkBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            checkBtn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            todayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 85),
            todayButton.leadingAnchor.constraint(equalTo: checkBtn.trailingAnchor, constant: 10),
            
            dismissBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            dismissBtn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            detailBtn.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            detailBtn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailBtn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            ])
        
        scrollView.contentSize.width = imageView.frame.width * 2
        
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    @objc func detailBtnAction(_ sender: UIButton) {
        print("자세히보기")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
