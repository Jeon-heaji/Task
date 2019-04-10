//
//  ViewController.swift
//  20190403_UIsegmentedController
//
//  Created by Jeon-heaji on 03/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let temp = unwindSegue.source as? SecondViewController else { return }
        
        if temp.segmentedOutlet.selectedSegmentIndex == -1 {
            
        } else {
            countLabel.text = temp.segmentedOutlet.titleForSegment(at: temp.segmentedOutlet.selectedSegmentIndex)
        }
     
 
    }

}

