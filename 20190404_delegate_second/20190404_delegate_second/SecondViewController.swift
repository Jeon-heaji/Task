//
//  SecondViewController.swift
//  20190404_delegate_second
//
//  Created by Jeon-heaji on 08/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    
    func sendText(_ value: String)
}

class SecondViewController: UIViewController {
    var name = "김철수"
    weak var delegate: SecondViewControllerDelegate?
    
    var temp = ""

    @IBOutlet weak var countLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate?.sendText(name)

        
    }

}
