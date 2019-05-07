//
//  AppDelegate.swift
//  20190507UITapGestureRecognizer
//
//  Created by Jeon-heaji on 07/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window?.backgroundColor = .white
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        let vc = ViewController()
        let secondVC = SecondViewController()
        
        vc.tabBarItem = UITabBarItem(title: "TouchesBegan", image: .none, tag: 1)
        secondVC.tabBarItem = UITabBarItem(title: "TapGesture", image: .none, tag: 2)
        
        tabBarController.viewControllers = [vc, secondVC]
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        
        return true
    }

   


}

