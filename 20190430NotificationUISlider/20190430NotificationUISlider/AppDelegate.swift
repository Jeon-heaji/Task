//
//  AppDelegate.swift
//  20190430NotificationUISlider
//
//  Created by Jeon-heaji on 04/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.backgroundColor = .white
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tab = UITabBarController()
        let sVc = SilderViewController()
        let resultVC = ResultViewController()
        resultVC.notificationSet()
        
        sVc.tabBarItem = UITabBarItem(title: "1", image: .none, tag: 0)
        resultVC.tabBarItem = UITabBarItem(title: "2", image: .none, tag: 1)
        
        tab.viewControllers = [sVc,resultVC]
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tab
        
        
        
        return true
    }

   


}

