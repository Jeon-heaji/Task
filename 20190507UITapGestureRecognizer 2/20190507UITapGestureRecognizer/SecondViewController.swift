//
//  SecondViewController.swift
//  20190507UITapGestureRecognizer
//
//  Created by Jeon-heaji on 07/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let countLabel: LabelView = {
        let countLabel = LabelView(frame: .zero, name: "횟수")
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.label.font = UIFont.boldSystemFont(ofSize: 20)
        countLabel.label.textColor = .gray
        countLabel.label.textAlignment = .left
        return countLabel
        
    }()
    
    let coordinateLabel: LabelView = {
        let coordinateLabel = LabelView(frame: .zero, name: "좌표")
        coordinateLabel.translatesAutoresizingMaskIntoConstraints = false
        coordinateLabel.label.font = UIFont.boldSystemFont(ofSize: 20)
        coordinateLabel.label.textColor = .gray
        coordinateLabel.label.textAlignment = .left
        return coordinateLabel
        
    }()
    var savePoint = CGPoint.zero
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(countLabel)
        view.addSubview(coordinateLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureFunc(_:)))
        view.addGestureRecognizer(tapGesture)
        
        view.backgroundColor = .white
        autoLayout()
      
    }
    
    @objc func tapGestureFunc(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        print("location", location)
        if abs(location.x - savePoint.x) > 10 || abs(location.y - savePoint.y) > 10 {
            count = 0
        }
        savePoint = location
        coordinateLabel.label.text = //"좌표: \(location)"
        "좌표: (\(String(format: "%.1f", location.x)), \(String(format: "%.1f", location.y)))"
        count += 1
        countLabel.label.text = "횟수: \(count)"
        
        }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
            countLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            countLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            countLabel.heightAnchor.constraint(equalToConstant: 40),
            
            coordinateLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 30),
            coordinateLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            coordinateLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            coordinateLabel.heightAnchor.constraint(equalToConstant: 40),
            
            ])
        
    }
   
}
