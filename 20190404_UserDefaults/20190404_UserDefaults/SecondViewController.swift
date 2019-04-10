//
//  SecondViewController.swift
//  20190404_UserDefaults
//
//  Created by Jeon-heaji on 04/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let temp = UserDefaults.standard
        
        countLabel.text = temp.string(forKey: "tf")
     
    }
    @IBAction func backButton(_ sender: UIButton) {
       
    }

}
