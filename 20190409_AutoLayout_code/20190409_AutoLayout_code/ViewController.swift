//
//  ViewController.swift
//  20190409_AutoLayout_code
//
//  Created by Jeon-heaji on 10/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//
// AutoLayout code로 구현

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    let grayView = UIView()
    let greenView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        activateLayoutAnchors()
        
    }
    func uiSet() {
        redView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        view.addSubview(redView)
        
        blueView.backgroundColor = #colorLiteral(red: 0.7767996832, green: 0.8876433244, blue: 1, alpha: 1)
        view.addSubview(blueView)
        
        yellowView.backgroundColor = #colorLiteral(red: 1, green: 0.9922760004, blue: 0.6464221771, alpha: 1)
        view.addSubview(yellowView)
        
        grayView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(grayView)
        
        greenView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        view.addSubview(greenView)
        
    }
    
    func activateLayoutAnchors() {
        //redView -> 1
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 150).isActive = true
 
        //blueView -> 2
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 8).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        
        //yellowView -> 3
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: 8).isActive = true
        yellowView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 0.7, constant: -2).isActive = true
        
        //grayView -> 4
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        grayView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 8).isActive = true
        grayView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        grayView.widthAnchor.constraint(equalTo: yellowView.widthAnchor, multiplier: 0.7, constant: -3).isActive = true
        
        //greenView -> 5
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        greenView.leadingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: 8).isActive = true
        greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        greenView.widthAnchor.constraint(equalTo: grayView.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
 
    }

}
