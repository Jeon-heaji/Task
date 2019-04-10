//
//  SecondViewController.swift
//  SingletonExample
//
//  Created by Jeon-heaji on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPwLabel: UILabel!
    @IBOutlet weak var userAgeLabel: UILabel!
    @IBOutlet weak var userMobileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       userNameLabel.text = UserData.shared.userName
        userPwLabel.text = UserData.shared.userPassword
        userAgeLabel.text = UserData.shared.userAge
        userMobileLabel.text = UserData.shared.userMobile
        
    }

}
