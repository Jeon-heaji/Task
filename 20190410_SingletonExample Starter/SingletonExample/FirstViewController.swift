//
//  ViewController.swift
//  SingletonExample
//
//  Created by Wi on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var mobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        password.delegate = self
        age.delegate = self
        mobile.delegate = self
       
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let nameText = name.text else {return false}
        guard let pwText = password.text else {return false}
        guard let ageText = age.text else {return false}
        guard let mobileText = mobile.text else {return true}
        
        UserData.shared.userName = nameText
        UserData.shared.userPassword = pwText
        UserData.shared.userAge = ageText
        UserData.shared.userMobile = mobileText
        
        name.resignFirstResponder()
        password.resignFirstResponder()
        age.resignFirstResponder()
        mobile.resignFirstResponder()
        
        return true
    }

}

