//
//  ViewController.swift
//  TestRequestData
//
//  Created by Jeon-heaji on 23/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//    let baseView = Bundle.main.loadNibNamed("BaseView", owner:self, options:nil)
    let baseView = Bundle.main.loadNibNamed("BaseView", owner:self, options:nil)?.first as! BaseView
//    let story = UIStoryboard(name: "BaseView", bundle: nil)
    
//    lazy var baseView = BaseView(frame: CGRect(
//        x: 0,
//        y: 0,
//        width: view.frame.width,
//        height: view.frame.height))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseView)
        
        
    }


}

