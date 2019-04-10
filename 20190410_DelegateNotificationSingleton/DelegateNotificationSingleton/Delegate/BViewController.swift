//
//  BViewController.swift
//  DelegateNotificationSingleton
//
//  Created by Wi on 09/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
protocol BViewControllerDelegate: class {
    func sendText(text: String)
}


class BViewController: UIViewController, TodoList {
    weak var delegate:  BViewControllerDelegate?
   
    
    
    @IBOutlet weak var textFieldController: UITextField!
    
    @IBOutlet weak var label: UILabel!
    var data: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = data
        
    }
    

    func textPresnt(_ text: String?) {
        data = text
    }
    @IBAction func toBossViewBtnDidTap(_ sender: Any) {
        delegate?.sendText(text: textFieldController.text!)
        
        dismiss(animated: true, completion: nil)
  
    }
    
    

}
