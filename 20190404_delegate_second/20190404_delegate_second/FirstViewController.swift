//
//  ViewController.swift
//  20190404_delegate_second
//
//  Created by Jeon-heaji on 08/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    var secondVC: SecondViewController?

    @IBOutlet weak var textFieldController: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
    }
    @IBAction func actionButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondVC" {
            guard let sVC = segue.destination as? SecondViewController else {return}
            sVC.delegate = self
            secondVC = sVC
            
//            let sVc = SecondViewController()
//            present(sVC, animated: true)
        }
    }
    
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
   
    }

}
extension FirstViewController: SecondViewControllerDelegate {
    func sendText(_ value: String) {
//        let svc = SecondViewController()
//        svc.countLabel.text = value
        secondVC?.countLabel.text = textFieldController.text
        
    }
    
    
}

