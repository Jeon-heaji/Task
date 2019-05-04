//
//  SecondViewController.swift
//  20190430Notification
//
//  Created by Jeon-heaji on 30/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
extension SecondViewController {
    static var changeValue: Notification.Name {
        return Notification.Name("changeValue")
    }
}

class SecondViewController: UIViewController {
    
    let displayLabel: UILabel = {
        let displayLabel = UILabel()
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        displayLabel.textAlignment = .center
//        displayLabel.text = "111"
        return displayLabel
    }()
    
    let noti = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(displayLabel)
        autoLayout()
        notificationSet()
    }
    
    func notificationSet() {
        noti.addObserver(
            self,
            selector: #selector(addNotificationObserver),
            name: SecondViewController.changeValue,
            object: nil)
    }
    
    @objc func addNotificationObserver(_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String: String] else { return }
        displayLabel.text = userInfo["sendText"]
        
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
            displayLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            displayLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            displayLabel.heightAnchor.constraint(equalToConstant: 40),
            ])
    }
    
}
