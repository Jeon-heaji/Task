//
//  SecondViewController.swift
//  20190403_UIsegmentedController
//
//  Created by Jeon-heaji on 03/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var temp1 = "-1"
    

    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
 
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func segmentControllerAction(_ sender: Any) {
        print(segmentedOutlet.selectedSegmentIndex)
        
//        guard var temp = segmentedOutlet.titleForSegment(at: segmentedOutlet.selectedSegmentIndex) else { return }
//        temp = temp1

    }
    @IBAction func countButton(_ sender: UIButton) {
       print(segmentedOutlet.selectedSegmentIndex)
        if segmentedOutlet.selectedSegmentIndex == -1 {
            
        }
    }
    
    
    

}
