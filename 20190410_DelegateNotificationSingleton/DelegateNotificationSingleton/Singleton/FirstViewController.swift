//
//  ViewController.swift
//  DelegateNotificationSingleton
//
//  Created by Wi on 09/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {return true}
        UserData.shared.userName = text
        textField.resignFirstResponder()

        return true
    }
}

