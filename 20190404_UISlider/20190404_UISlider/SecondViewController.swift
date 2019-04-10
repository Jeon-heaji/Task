//
//  SecondViewController.swift
//  20190404_UISlider
//
//  Created by Jeon-heaji on 04/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //button, singleton변수생성
    var backButton = UIButton()
    var singletonA = SingletonClass.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfiguration()
        view.backgroundColor = .white
        
        // view.backgroundColor -> UIColor , Float -> CGFloat타입으로 변환
        view.backgroundColor = UIColor(red: CGFloat(singletonA.redSlider1), green: CGFloat(singletonA.greenSlider1), blue: CGFloat(singletonA.blueSlider1), alpha: 1)
    }
    
    func viewConfiguration() {
        // backButton
        backButton.frame = CGRect(x: view.center.x - 100, y: 300, width: 200, height: 70)
        backButton.addTarget(self, action: #selector(backButtonFunc(_:)), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.gray, for: .normal)
        view.addSubview(backButton)
    }
    
    @objc func backButtonFunc(_ sender: UIButton) {
       dismiss(animated: true)
    }

}
