//
//  AppDelegate.swift
//  KingfisherExample
//
//  Created by Jeon-heaji on 05/07/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
       
        window?.rootViewController = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        window?.makeKeyAndVisible()
        return true
    }



}

