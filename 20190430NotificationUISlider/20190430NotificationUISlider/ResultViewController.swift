//
//  ResultViewController.swift
//  20190430NotificationUISlider
//
//  Created by Jeon-heaji on 04/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
extension ResultViewController {
    static var changeBackgroundColor: Notification.Name {
        return Notification.Name("changeBackgroundColor")
    }
}
class ResultViewController: UIViewController {
    let notiCenter = NotificationCenter.default
    
    let colorView: UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        return colorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(colorView)
        notificationSet()
        autoLayout()
    }
  
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: guide.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
    }
    
    func notificationSet() {
        notiCenter.addObserver(
            self,
            selector: #selector(addObserverFunc(_:)),
            name: ResultViewController.changeBackgroundColor,
            object: nil)
    }
    
    @objc func addObserverFunc(_ noti: Notification) {
        guard let userInfo = noti.userInfo as? [String: UIColor] else { return }
        
        let backColor = userInfo["color"]
        colorView.backgroundColor = backColor
      
    }
    
    deinit {
        notiCenter.removeObserver(self)
    }

}
