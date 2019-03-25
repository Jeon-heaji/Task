//
//  ViewController.swift
//  190325 1
//
//  Created by Jeon-heaji on 25/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     let blueView = UIView()
     let redView = UIView()
     let greenView = UIView()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 30, y: 30, width: view.frame.width - 60, height: view.frame.height - 60)
        
       
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 30, y: 30, width: blueView.frame.width - 60, height: blueView.frame.height - 60)
        
        greenView.backgroundColor = .green
        greenView.frame = CGRect(x: 30, y: 30, width: redView.frame.width - 60, height: redView.frame.height - 60)
        

        
        view.addSubview(blueView)
        blueView.addSubview(redView)
        redView.addSubview(greenView)
    }

}

