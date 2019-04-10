//
//  ViewController.swift
//  20190404_Singleton
//
//  Created by Jeon-heaji on 04/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var textFieldController: UITextField!
    
    var singletonB = Singleton.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
 
    @IBAction func actionButton(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let result = textFieldController.text {
            singletonB.singletonA = result
        }
    }

    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
       
    }
 
}

