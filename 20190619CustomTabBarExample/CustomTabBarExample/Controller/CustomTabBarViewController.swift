//
//  CustomTabBarViewController.swift
//  CustomTabBarExample
//
//  Created by Jeon-heaji on 19/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//
import UIKit

class CustomTabBarViewController: UIViewController {
    
    // MARK: - Properties
    
    var menuView = MenuView()
    
    var menuTitles = ["menu1","menu2","menu3", "menu4", "menu5", "menu6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CustomTabBar"
        menuView.menuTitles = menuTitles
        menuView.menuBar.menuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.menuBar.indicatorBar.widthAnchor.constraint(equalToConstant: self.view.frame.width / CGFloat(menuTitles.count)).isActive = true
        
        menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
}

