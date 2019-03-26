//
//  ViewController.swift
//  20190326_2 영상참고
//
//  Created by Jeon-heaji on 26/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }

    @IBAction func editingDidBegin(_ sender: Any) {
        print("editingDidBegin")
    }
    
    @IBAction func textFieldController(_ sender: UITextField) {
        print("editingchanged")
        myLabel.text = sender.text
        myLabel.textColor = UIColor.blue
        myLabel.font = UIFont.systemFont(ofSize: 40)
      
    }
    @IBAction func didEndOnExit(_ sender: Any) {
        print("didEndOnExit")
    }
    @IBAction func primaryActionTriggered(_ sender: Any) {
        print("pirmaryActionTriggered")
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        print("editingDidEnd")
        myLabel.text = sender.text
        myLabel.textColor = UIColor.red
        myLabel.font = UIFont.systemFont(ofSize: 20)
      
    }


}

