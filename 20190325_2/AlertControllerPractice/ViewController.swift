//
//  ViewController.swift
//  AlertControllerPractice
//
//  Created by Jeon-heaji on 25/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0

    let numberLabel = UILabel()
    let buttonController = UIButton(type: .system)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonController.frame = CGRect(x: 150 , y: 150, width: 100, height: 100)
        buttonController.setTitle("Button", for: .normal)
        buttonController.addTarget(self, action: #selector(didTapAction(_sender:)), for: .touchUpInside)
        
        view.addSubview(buttonController)
        
        
        numberLabel.text = "0"
        numberLabel.frame = CGRect(x: 200 , y: 300, width: 100, height: 100)
        view.addSubview(numberLabel)
        
    }
    @objc func didTapAction(_sender:Any) {
        let alertController = UIAlertController(title: "숫자증가",message: " +1 ", preferredStyle: .alert)
        
        let upAction = UIAlertAction(title: "UP", style: UIAlertAction.Style.default) { _ in
            self.count += 1
            self.numberLabel.text = String(self.count)
            print("+1")
            }
        let resetAction = UIAlertAction(title: "reset", style: UIAlertAction.Style.destructive) { _ in
            self.count = 0
            self.numberLabel.text = String(self.count)
            
            }
        let cancel = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel) { _ in
            print("취소")
            
        }
            
            alertController.addAction(cancel)
            alertController.addAction(upAction)
            alertController.addAction(resetAction)
            present(alertController, animated: true)
            
        }
    
       
}
        
        

