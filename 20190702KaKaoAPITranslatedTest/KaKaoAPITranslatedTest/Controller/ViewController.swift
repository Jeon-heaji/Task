//
//  ViewController.swift
//  KaKaoAPITranslatedTest
//
//  Created by Jeon-heaji on 30/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     let baseView = Bundle.main.loadNibNamed("BaseView", owner:self, options:nil)?.first as! BaseView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseView)
        
    }


}

