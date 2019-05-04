//
//  AppDelegate.swift
//  20190430Notification
//
//  Created by Jeon-heaji on 30/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window?.backgroundColor = .white
        window? = UIWindow(frame: UIScreen.main.bounds)
        
        let tab = UITabBarController()
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        
        let navi = UINavigationController(rootViewController: firstVC)
        tab.viewControllers = [navi, secondVC]
        firstVC.tabBarItem = UITabBarItem(title: "1", image: .none, tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "2", image: .none, tag: 1)
        
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tab
 
        return true
    }


}

