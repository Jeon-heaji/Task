//
//  MainTabBarControllerViewController.swift
//  Instagram
//
//  Created by Jeon-heaji on 08/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    let homeVC = HomeViewController()
    let plusVC = PlusViewController()
    let picKer = UIImagePickerController()
    let myVC = MyViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        picKer.delegate = self
        // 탭바 위에 뷰컨트롤러 올리기
       
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.homeNomal), selectedImage: UIImage(named: AppImageData.homeSelected))
        plusVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.plus), selectedImage: UIImage(named: AppImageData.plus))
        
        // homeVC에 네비게이션 적용시키기
        viewControllers = [UINavigationController.init(rootViewController: homeVC), plusVC, UINavigationController(rootViewController: myVC)]
        
        self.delegate = self
        // 탭에있는 타이틀을 없애고 이미지만 넣기
        for i in tabBar.items! {
            i.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
        }
    }
    
    // 탭바델리게이트 , 탭바클릭했을때 넘어갈건지말지 정하는 곳
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == plusVC {
            picKer.sourceType = .photoLibrary
            present(picKer, animated: true)
            return false
        }
        return true
    }
}

extension MainTabBarController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        NotificationCenter.default.post(
            name: Notification.Name("photoSelected"),
            object: nil,
            userInfo: ["image": info[.originalImage]])
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
}
