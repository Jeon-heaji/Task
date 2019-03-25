//
//  ViewController.swift
//  20190322_3
//
//  Created by Jeon-heaji on 25/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        if segmentedView.selectedSegmentIndex == 0{
//            mylabel.text = "First"
//        } else {
//            mylabel.text = "Second"
//        }
        
        segmentedView.addTarget(self, action: #selector(getter:segmentedView), for: .valueChanged)
        let index = segmentedView.selectedSegmentIndex
        mylabel.text = segmentedView.titleForSegment(at: index)
    }
    
    
    

//    @IBAction func segmentedController(_ sender:  UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            mylabel.text = "First"
//        }else  {
//            mylabel.text = "Second"
//        }
//
//
//    }
    @objc func segmentedController(_ sender:UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mylabel.text = "First"
        }else if sender.selectedSegmentIndex == 1 {
            mylabel.text = "Second"
           
        }
    }
 
}

