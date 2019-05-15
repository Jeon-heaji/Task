//
//  SecondViewController.swift
//  200190409_AlertController클매과제
//
//  Created by Jeon-heaji on 09/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var titleView = UIView()
    let yellowButton = UIButton(type: .system)
    let whiteButton = UIButton(type: .system)
    let checkButton = UIButton(type: .system)
    let textLabel = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfiguration()
        
    }
    
    func viewConfiguration() {
        
        // titleView
        titleView.frame = CGRect(x: 40, y: 270, width: view.frame.width - 80, height: 290)
        titleView.backgroundColor = #colorLiteral(red: 0.9216370558, green: 0.9216370558, blue: 0.9216370558, alpha: 1)
        titleView.layer.cornerRadius = 10
        view.addSubview(titleView)
        
        //yellowButton
        yellowButton.frame = CGRect(x: 70, y: 130, width: 60, height: 60)
        yellowButton.backgroundColor = #colorLiteral(red: 1, green: 0.988546955, blue: 0.7415356441, alpha: 1)
        yellowButton.layer.cornerRadius = yellowButton.frame.width / 2
        yellowButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        yellowButton.setTitleColor(.gray, for: .normal)
        yellowButton.setTitle("Yellow", for: .normal)
        yellowButton.addTarget(self, action: #selector(uiButton(_:)), for: .touchUpInside)
        titleView.addSubview(yellowButton)
        
        //whiteButton
        whiteButton.frame = CGRect(x: 230, y: 130, width: 60, height: 60)
        whiteButton.backgroundColor = .white
        whiteButton.layer.cornerRadius = whiteButton.frame.width / 2
        whiteButton.setTitle("White", for: .normal)
        whiteButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        whiteButton.setTitleColor(.gray, for: .normal)
        whiteButton.addTarget(self, action: #selector(uiButton(_:)), for: .touchUpInside)
        titleView.addSubview(whiteButton)
        
        //checkButton
        checkButton.frame = CGRect(x: 120, y: 230, width: 100, height: 40)
        checkButton.setTitle("확인", for: .normal)
        checkButton.backgroundColor = #colorLiteral(red: 0.7764712881, green: 0.7764712881, blue: 0.7764712881, alpha: 1)
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.layer.cornerRadius = 10
        checkButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        checkButton.addTarget(self, action: #selector(checkButtonFunc(_:)), for: .touchUpInside)
        
        titleView.addSubview(checkButton)
        
        //textLabel
        textLabel.frame = CGRect(x: 30, y: 45, width: 300, height: 40)
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.text = "색을 변경하시겠습니까?"
        textLabel.textAlignment = .center
        textLabel.textColor = .lightGray
        titleView.addSubview(textLabel)
    }
    
    @objc func uiButton(_ sender: UIButton) {
        
        if let firstVC = presentingViewController as? FirstViewController {
        
        switch sender {
        case yellowButton:
            firstVC.view.backgroundColor = #colorLiteral(red: 1, green: 0.9922760004, blue: 0.6464221771, alpha: 1)
        case whiteButton:
            firstVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        default:
            break
        }
     
    }
        
}
    @objc func checkButtonFunc(_ sender: UIButton) {
        dismiss(animated: true)
 
    }

}
