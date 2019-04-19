//
//  AppDelegate.swift
//  20190405_kakaoPage
//
//  Created by Jeon-heaji on 07/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        // window <- 이거 외우기
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        // tabBarCo ntroller, naviController,  fVC,aVC 추가
        let tabBarController = UITabBarController()
        let firstVc = FirstViewController()
        let addToVc = AddToFriendsViewController()
        let naviController = UINavigationController(rootViewController: firstVc)
        // naviController의 루트뷰는 firstVC 연결하기
  
        //tbaBarController에 navi add 배열로담고
        tabBarController.viewControllers = [naviController, addToVc]
        addToVc.title = "친구추가"
        
        // favorite, more tabBarItem추가
        firstVc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        addToVc.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
 
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
      
    }

}

