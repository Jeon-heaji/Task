//
//  ViewController.swift
//  20190430NotificationUISlider
//
//  Created by Jeon-heaji on 04/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SilderViewController: UIViewController {
    let notiCenter = NotificationCenter.default
    let customRed: SliderView = {
        let customRed = SliderView(frame: .zero, name: "Red", tag: 1)
        customRed.translatesAutoresizingMaskIntoConstraints = false
        customRed.label.textColor = .red
        customRed.slider.addTarget(self, action: #selector(setButtonDidTap(_:)), for: .valueChanged)
        return customRed
    }()
    
    let customGreen: SliderView = {
        let customGreen = SliderView(frame: .zero, name: "Green", tag: 2)
        customGreen.translatesAutoresizingMaskIntoConstraints = false
        customGreen.label.textColor = .green
        customGreen.slider.addTarget(self, action: #selector(setButtonDidTap(_:)), for: .valueChanged)
        return customGreen
    }()
    
    let customBlue: SliderView = {
        let customBlue = SliderView(frame: .zero, name: "Blue", tag: 3)
        customBlue.translatesAutoresizingMaskIntoConstraints = false
        customBlue.label.textColor = .blue
        customBlue.slider.addTarget(self, action: #selector(setButtonDidTap(_:)), for: .valueChanged)
        return customBlue
    }()
    
    let customAlpha: SliderView = {
        let customAlpha = SliderView(frame: .zero, name: "Alpah", tag: 4)
        customAlpha.translatesAutoresizingMaskIntoConstraints = false
        customAlpha.slider.addTarget(self, action: #selector(setButtonDidTap(_:)), for: .valueChanged)
        return customAlpha
    }()
    
    let setButton: UIButton = {
        let setButton = UIButton(type: .system)
        setButton.translatesAutoresizingMaskIntoConstraints = false
        setButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        setButton.setTitle("Set Button", for: .normal)
        setButton.setTitleColor(.gray, for: .normal)
        return setButton
    }()
    
    var red = CGFloat()
    var green = CGFloat()
    var blue = CGFloat()
    var alpha = CGFloat()
    let resultVC = ResultViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
     
        view.addSubview(customRed)
        view.addSubview(customGreen)
        view.addSubview(customBlue)
        view.addSubview(customAlpha)
        view.addSubview(setButton)
        
        autoLayout()
    }
    // tag이용해서 slider에 값 확인?
    @objc func setButtonDidTap(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            red = CGFloat(sender.value)
        case 2:
            green = CGFloat(sender.value)
        case 3:
            blue = CGFloat(sender.value)
        case 4:
            alpha = CGFloat(sender.value)
        default:
            break
        }
    }
    
    @objc func didTapButton(_ sender: UIButton) {
//        resultVC.notificationSet()
        print("버튼누름")
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        notiCenter.post(
            name: ResultViewController.changeBackgroundColor,
            object: nil,
            userInfo: ["color": color])
        
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            customRed.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            customRed.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            customRed.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            
            customGreen.topAnchor.constraint(equalTo: customRed.bottomAnchor, constant: 20),
            customGreen.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            customGreen.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            
            customBlue.topAnchor.constraint(equalTo: customGreen.bottomAnchor, constant: 20),
            customBlue.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            customBlue.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            
            customAlpha.topAnchor.constraint(equalTo: customBlue.bottomAnchor, constant: 20),
            customAlpha.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            customAlpha.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            
            setButton.topAnchor.constraint(equalTo: customAlpha.bottomAnchor, constant: 10),
            setButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            setButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            setButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant:  -60),
            
           ])
    }
    
}

