//
//  AppDelegate.swift
//  ITunesAPIPractice
//
//  Created by Jeon-heaji on 08/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.backgroundColor = .white
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = ViewController()
        let navi = UINavigationController(rootViewController: vc)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = navi
        return true
    }


}

