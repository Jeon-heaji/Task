//
//  ViewController.swift
//  20190411_UIScrollView_UIPageControll_AutoLayout
//
//  Created by Jeon-heaji on 12/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
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
        view.addSubview(scrollView)
        
        aView.backgroundColor = #colorLiteral(red: 0.4103879568, green: 0.6745555522, blue: 0.7913229695, alpha: 1)
        scrollView.addSubview(aView)
        
        bView.backgroundColor = #colorLiteral(red: 0.4575022762, green: 0.7725650381, blue: 0.335836883, alpha: 1)
        scrollView.addSubview(bView)
        
        cView.backgroundColor = #colorLiteral(red: 0.8838634201, green: 0.4727768686, blue: 0.2111204939, alpha: 1)
        scrollView.addSubview(cView)
        
        dView.backgroundColor = #colorLiteral(red: 0.9580028553, green: 0.8536632636, blue: 0.4172002261, alpha: 1)
        scrollView.addSubview(dView)
        
        
        
       
    }
    
    func activateLayoutAnchors() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        aView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        aView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        aView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        aView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.25).isActive = true
//        aView.widthAnchor
        
    }


}

