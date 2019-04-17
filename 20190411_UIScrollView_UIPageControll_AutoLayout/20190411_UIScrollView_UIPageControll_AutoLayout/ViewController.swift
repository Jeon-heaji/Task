//
//  ViewController.swift
//  20190411_UIScrollView_UIPageControll_AutoLayout
//
//  Created by Jeon-heaji on 12/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let aScrollView = UIScrollView()
    let aView = UIView()
    let bView = UIView()
    let cView = UIView()
    let dView = UIView()
   
    
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        viewContfiguration()
        activateLayoutAnchors()
        
        
        
    }
    
    func viewContfiguration() {
        view.addSubview(aScrollView)
        
        aView.backgroundColor = #colorLiteral(red: 0.4103879568, green: 0.6745555522, blue: 0.7913229695, alpha: 1)
        aScrollView.addSubview(aView)
        
        bView.backgroundColor = #colorLiteral(red: 0.4575022762, green: 0.7725650381, blue: 0.335836883, alpha: 1)
        aScrollView.addSubview(bView)
        
        cView.backgroundColor = #colorLiteral(red: 0.8838634201, green: 0.4727768686, blue: 0.2111204939, alpha: 1)
        aScrollView.addSubview(cView)
        
        dView.backgroundColor = #colorLiteral(red: 0.9580028553, green: 0.8536632636, blue: 0.4172002261, alpha: 1)
        aScrollView.addSubview(dView)
        
        
        
       
    }
    
    func activateLayoutAnchors() {
        
        aScrollView.translatesAutoresizingMaskIntoConstraints = false
        aScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        aScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        aScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        aScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        aScrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        aScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.topAnchor.constraint(equalTo: aScrollView.topAnchor).isActive = true
        aView.leadingAnchor.constraint(equalTo: aScrollView.leadingAnchor).isActive = true
        aView.bottomAnchor.constraint(equalTo: aScrollView.bottomAnchor).isActive = true
        aView.heightAnchor.constraint(equalTo: aScrollView.heightAnchor).isActive = true
        aView.widthAnchor.constraint(equalTo: aScrollView.widthAnchor, multiplier: 0.25).isActive = true
        aView.widthAnchor
        
    }


}

