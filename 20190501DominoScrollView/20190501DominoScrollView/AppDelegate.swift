//
//  AppDelegate.swift
//  Domino
//
//  Created by Jeon-heaji on 01/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window?.backgroundColor = .white
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let tabBar = UITabBarController()
        let vc = ViewController()
        let secondVC = SecondViewController()
        vc.tabBarItem = UITabBarItem(title: "Table", image: .none, tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Fake", image: .none, tag: 1)
        
        tabBar.viewControllers = [vc, secondVC]
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBar
        
        return true
    }




}

