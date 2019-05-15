//
//  FirstViewController.swift
//  200190409_AlertController클매과제
//
//  Created by Jeon-heaji on 09/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
     var alertButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9283292431, blue: 0.9507432212, alpha: 1)
        viewConfiguration()
        
    }
    
    func viewConfiguration() {
        
        alertButton.frame = CGRect(x: 125, y: 400, width: 160, height: 40)
        alertButton.setTitle("Alert Button", for: .normal)
        alertButton.layer.cornerRadius = 10
        alertButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.addTarget(self, action: #selector(alertButtonFunc(_:)), for: .touchUpInside)
        view.addSubview(alertButton)
        
    }
    
    @objc func alertButtonFunc(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .overCurrentContext
        present(secondVC, animated: true)
    }

}

