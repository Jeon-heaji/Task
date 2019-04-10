//
//  ViewController.swift
//  20190405_kakaoPage
//
//  Created by Jeon-heaji on 07/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // 넘겨올VC
    let addToVc = AddToFriendsViewController()
    // 친구목록Label
    var friendsLabel = UILabel()
    // 친구목록 담을 배열
    var friendsLissArr: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        
        addToVc.delegate = self
        title = "친구"
     
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        let barButton = UIBarButtonItem(title: "친구추가", style: .done, target: self, action: #selector(pushViewController(_:)))
            navigationItem.rightBarButtonItem = barButton
  
    }

    func viewConfiguration() {
        friendsLabel.frame = CGRect(x: 40, y: 230, width: 340, height: 400)
        friendsLabel.backgroundColor = #colorLiteral(red: 0.8647990664, green: 0.9668156919, blue: 0.9764705896, alpha: 1)
        friendsLabel.text = "친구없음!"
        friendsLabel.numberOfLines = 0
        friendsLabel.font = UIFont.systemFont(ofSize: 25)
        friendsLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        friendsLabel.textAlignment = .center
        view.addSubview(friendsLabel)
    }
    
    //navigation BarButtonFunc -> 어디로 가는지? 셀렉터로 연결됨
    // navigation -> push 랑 pop !
    @objc private func pushViewController(_ sender: Any) {
        
        navigationController?.pushViewController(addToVc, animated: true)

    }

}

extension FirstViewController: AddToFriendsViewControllerDelegate {
    func sendData(name: String) {
        friendsLissArr.append(name)
        
        var temp = ""
        for i in friendsLissArr {
            temp += "\(i)\n"
        }
        
        friendsLabel.text = temp
        
    }
}
