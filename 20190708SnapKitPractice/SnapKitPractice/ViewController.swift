//
//  ViewController.swift
//  SnapKitPractice
//
//  Created by Jeon-heaji on 08/07/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "toystory")
        return imageView
    }()
    lazy var playBtn: UIButton = {
        let playBtn = UIButton(type: .custom)
        playBtn.setImage(UIImage(named: "play"), for: .normal)
        playBtn.setImage(UIImage(named: "pause"), for: .selected)
        playBtn.alpha = 1
        playBtn.addTarget(self, action: #selector(playButtonDidTap(_:)), for: .touchUpInside)
        return playBtn
    }()
    let forwardBtn: UIButton = {
        let forwardBtn = UIButton(type: .custom)
        forwardBtn.setImage(UIImage(named: "forward"), for: .normal)
        forwardBtn.alpha = 1
        forwardBtn.addTarget(self, action: #selector(forwardButtonDidTap(_:)), for: .touchUpInside)
        return forwardBtn
    }()
    let backwardBtn: UIButton = {
        let backwardBtn = UIButton(type: .custom)
        backwardBtn.setImage(UIImage(named: "backward"), for: .normal)
        backwardBtn.alpha = 1
        backwardBtn.addTarget(self, action: #selector(backwardButtonDidTap(_:)), for: .touchUpInside)
        return backwardBtn
    }()
    let label: UILabel = {
        let label = UILabel()
        label.text = "ToyStory"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    let slider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(sliderDidTap(_:)), for: .valueChanged)
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(self.view)
        }
        view.addSubview(playBtn)
        playBtn.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.centerY.equalTo(view.snp.centerY)
            $0.width.height.equalTo(50)
        }
        
        view.addSubview(backwardBtn)
        backwardBtn.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.left.equalTo(150)
            $0.width.height.equalTo(60)
        }
        
        view.addSubview(forwardBtn)
        forwardBtn.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.left.equalTo(700)
            $0.width.height.equalTo(60)
        }
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(40)
            $0.width.equalTo(self.view)
        }
        view.addSubview(slider)
        slider.snp.makeConstraints {
            $0.top.equalTo(500)
            $0.left.equalTo(20)
            $0.width.equalTo(self.view)
        }
        
       
    }
    
    @objc func playButtonDidTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.playBtn.alpha = 0

        }
        sender.isSelected.toggle()
        UIView.animate(withDuration: 0.3, animations: {
            self.playBtn.alpha = 1
        }, completion: nil)
        
    }
    @objc func backwardButtonDidTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.backwardBtn.alpha = 0
            
        }
        sender.isSelected.toggle()
        UIView.animate(withDuration: 0.3, animations: {
            self.backwardBtn.alpha = 1
        }, completion: nil)
    }
    @objc func forwardButtonDidTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.forwardBtn.alpha = 0
            
        }
        sender.isSelected.toggle()
        UIView.animate(withDuration: 0.3, animations: {
            self.forwardBtn.alpha = 1
        }, completion: nil)
    }
    
    @objc func sliderDidTap(_ sender: UISlider) {
        var current = CGFloat(slider.value)
        
        
    }
    
}

