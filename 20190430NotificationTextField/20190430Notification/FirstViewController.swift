//
//  ViewController.swift
//  20190430Notification
//
//  Created by Jeon-heaji on 30/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        textfield.placeholder = "입력하세요"
        return textfield
    }()
    
    let noti = NotificationCenter.default
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(textfield)
        autoLayout()
        textfield.delegate = self
  
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50),
            textfield.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            textfield.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            textfield.heightAnchor.constraint(equalToConstant: 40),
            ])
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        secondVC.notificationSet()
        noti.post(
            name: SecondViewController.changeValue,
            object: nil,
            userInfo: ["sendText":textField.text!])
//        print(textField.text)
        navigationController?.pushViewController(secondVC, animated: true)
        return true
    }
    
    
}
