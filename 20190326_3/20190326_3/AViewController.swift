//
//  AViewController.swift
//  20190326_3
//
//  Created by Jeon-heaji on 26/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    let aViewLabel = UILabel()
    let aViewButton = UIButton()
    var count = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        // Do any additional setup after loading the view.
        aViewLabel.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        aViewLabel.backgroundColor = .blue
        aViewLabel.textColor = .white
        aViewLabel.text = "0"
        aViewLabel.textAlignment = .center
        view.addSubview(aViewLabel)
        
        aViewButton.frame = CGRect(x: 100, y: 300, width: 80, height: 80)
        aViewButton.addTarget(self, action: #selector(aViewButtonAction) , for: .touchUpInside)
        aViewButton.setTitle("bView", for: .normal)
        aViewButton.backgroundColor = .gray
        view.addSubview(aViewButton)
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        aViewLabel.text = "\(count)"
        
//        print("viewWillAppear")
        
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        print("viewDidAppear")
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        print("viewWillDisappear")
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        print("viewDidDisappear")
//    }
//
    @objc func aViewButtonAction() {
        let bVC = BViewController()
        present(bVC, animated: true)
        
        count += 1
        
    }
    


    
    
}

