//
//  ViewController.swift
//  20190322_2
//
//  Created by Jeon-heaji on 25/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var switchView: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        switchView.addTarget(self, action: #selector(switchController(_:)), for: .valueChanged)
        if switchView.isOn {
            myLabel.text = "On"
        } else {
            myLabel.text = "Off"
        }
    
    }

//    @IBAction func switchController(_ sender: UISwitch) {
//
//        if sender.isOn {
//            myLabel.text = "ON"
//        }else {
//            myLabel.text = "OFF"
//        }
//
//
//    }
    
    
    @objc func switchController(_ sender: UISwitch) {
        if sender.isOn {
            myLabel.text = "On"
        } else {
            myLabel.text = "Off"
        }
    }
    
}

