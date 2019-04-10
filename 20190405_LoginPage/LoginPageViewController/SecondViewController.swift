//
//  SecondViewController.swift
//  LoginPageViewController
//
//  Created by Jeon-heaji on 05/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // checkIDLabel, singOutButton
    var checkIDLabel = UILabel()
    var signOutButton = UIButton()
    
    let user = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewConfiguration()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let fVC = presentingViewController as? FirstViewController {
            self.checkIDLabel.text = "\(fVC.idTextField.text!) 님 환영합니다!"
            
        }        
    }

    func viewConfiguration() {
        //checkIDLabel
        checkIDLabel.frame = CGRect(x: 10, y: 200, width: view.frame.width, height: 80)
        checkIDLabel.text = ""
        checkIDLabel.textColor = .gray
        checkIDLabel.font = UIFont.boldSystemFont(ofSize: 20)
        checkIDLabel.textAlignment = .center
        view.addSubview(checkIDLabel)
        
        //signOutButton
        signOutButton.frame = CGRect(x: view.center.x - 100, y: 400, width: 200, height: 60)
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.addTarget(self, action: #selector(signOutButtonFunc(_:)), for: .touchUpInside)
        signOutButton.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        view.addSubview(signOutButton)
    }

    //ButtonFunc -> dismiss
    @objc func signOutButtonFunc(_ sender: UIButton) {
        
        dismiss(animated: true)
        
    }
 
}
