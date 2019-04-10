//
//  SecondViewController.swift
//  20190404_Singleton
//
//  Created by Jeon-heaji on 04/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
     // singletonC변수생성 -> singleton참조
    let singletonC = Singleton.shared
   
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // countLabel.text에 FVC의 sisngletonA를 가져옴
        countLabel.text = singletonC.singletonA
        
//        print(singletonC.singletonA)
    }
    
    @IBAction func backButton(_ sender: Any) {
    }
    
}
