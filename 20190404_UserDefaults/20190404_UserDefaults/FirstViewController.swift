//
//  ViewController.swift
//  20190404_UserDefaults
//
//  Created by Jeon-heaji on 04/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let newUserDefaults = UserDefaults.standard
    
    @IBOutlet weak var textFieldController: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    @IBAction func actionButton(_ sender: UIButton) {
        let textStore = textFieldController.text
        newUserDefaults.set(textStore, forKey: "tf")
        
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: "firstButton", sender: sender)
        
    }
  
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
      
    }

}
