//
//  BViewController.swift
//  20190326_3
//
//  Created by Jeon-heaji on 26/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    let bViewLabel = UILabel()
    let bViewButton = UIButton()
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        bViewLabel.frame = CGRect(x: 300, y: 100, width: 80, height: 80)
        bViewLabel.backgroundColor = .gray
        bViewLabel.textColor = .white
        bViewLabel.text = "0"
        bViewLabel.textAlignment = .center
        view.addSubview(bViewLabel)
        
        bViewButton.frame = CGRect(x: 300, y: 300, width: 80, height: 80)
        bViewButton.backgroundColor = .gray
        bViewButton.setTitle("뒤로가기", for: .normal)
        bViewButton.setTitleColor(.white, for: .normal)
        bViewButton.addTarget(self, action: #selector(bViewButtonAction), for: .touchUpInside)
        view.addSubview(bViewButton)
        
        

       
    }
    @objc func bViewButtonAction() {
        if let aVC = presentingViewController as? AViewController {
            aVC.count += 1
        }
        
        presentingViewController?.dismiss(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let vc = presentingViewController as? AViewController {
            bViewLabel.text = String(vc.count)
        }
    }
    

   

}
