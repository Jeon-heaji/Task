//
//  ViewController.swift
//  YogiyoSample
//
//  Created by Jeon-heaji on 07/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let userD = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeVC")
        view.backgroundColor = .white
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 유저가 다시 들어온 시점
        timeSet()
    }
    private func timeSet() {
        // 4. 버튼 체크유무 불러오기
        let isRemind = userD.value(forKey: "isRemind") as? Bool
        // 5. 팝업 내려간 시간 불러오기
        let checkTime = userD.value(forKey: "date") as? Date
        // 6. 현재 시간 체크
        let currentTime = Date()
        
        // 지금 시간을 만들어서 체크타임 + 86400 보다 작으면 안띄우고 크면 띄우고
        
        print("isRemind:", isRemind) // true
        print("checkTime:", checkTime)
        print("currentTime:", currentTime)
        
        // 7. 시간 비교 및 버튼 체크 유무 로직
        
        // 만약에 버튼이 체크가 되었고 현재 시간이 눌렀을때 시간 + 정해진 시간보다 크면
        if isRemind! == true && currentTime > checkTime! + 10 {
            // ex) 24시간이 지났을때 (24시간은 86400초)
            // 팝업 띄우기
            popUpSet()
        // 만약 버튼 체크를 안했으면(빈 체크)
        } else if isRemind! == false {
            // 팝업 띄우기
            popUpSet()
        }
    }
    
    private func popUpSet() {
        let popUpVC = PopUpViewController()
        popUpVC.modalPresentationStyle = .overCurrentContext
        present(popUpVC, animated: true)
        
    }
}
