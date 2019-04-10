//
//  AddToFriendsViewController.swift
//  20190405_kakaoPage
//
//  Created by Jeon-heaji on 07/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

// Delegate protocol선언
protocol AddToFriendsViewControllerDelegate: class {
    func sendData(name: String)
}

class AddToFriendsViewController: UIViewController, UITextFieldDelegate {
    
    //delegate 변수선언
    weak var delegate: AddToFriendsViewControllerDelegate?
    
    // friendsTextField, addButton
    var friendsTF = UITextField()
    var addButton = UIButton(type: .system)
    
    
    var titleView = UIView()
    var isDown = true
    
    var temp = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        viewConfiguration()
        navigationItem.title = "친구추가"
        navigationItem.largeTitleDisplayMode = .never
        friendsTF.delegate = self
    
    }

    
    func viewConfiguration() {
        
        //titleView
        titleView.frame = CGRect(x: 20, y: 30, width: view.frame.width, height: 450)
        titleView.backgroundColor = .white
        view.addSubview(titleView)
        
        //textField
        friendsTF.frame = CGRect(x: 75, y: 300, width: 240, height: 40)
        friendsTF.placeholder = "입력하세요!"
        friendsTF.textAlignment = .center
        friendsTF.becomeFirstResponder()
        friendsTF.borderStyle = .roundedRect
        titleView.addSubview(friendsTF)
        
        // addBotton
        addButton.frame = CGRect(x: 150, y: 400, width: 100, height: 40)
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        addButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        addButton.addTarget(self, action: #selector(addButtonFunc(_:)), for: .touchUpInside)
        addButton.layer.cornerRadius = 10
        titleView.addSubview(addButton)
        
    }
   
    
    @objc func addButtonFunc(_ sender: UIButton) {

        if friendsTF.text?.isEmpty == false {
            let alert = UIAlertController(title: "Success!", message: "\(friendsTF.text!) (이)가 추가되었습니다. ", preferredStyle: .alert)
            let ckAction = UIAlertAction(title: "확인", style: .default) { _ in
                self.friendsTF.text? = self.temp
            }
            alert.addAction(ckAction)
            present(alert, animated: true, completion: nil)
            
            
            if let data = friendsTF.text {
                
                delegate?.sendData(name: data)
 
            }
            
            if let firstVc = presentingViewController as? FirstViewController {
                firstVc.friendsLabel.text = friendsTF.text
            }
        } else {
            
            let errorAlert = UIAlertController(title: "Error", message: "이름을 입력하세요.", preferredStyle: .alert)
            let ck2Action = UIAlertAction(title: "확인", style: .default)
            errorAlert.addAction(ck2Action)
            present(errorAlert, animated: true)
            print("error 메세지뜸")
            
        }
       
    }
    
    //키보드 업,다운
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if isDown == true {
            UIView.animate(withDuration: 0.3) {
                self.titleView.frame.origin.y -= 100
                self.isDown = false
            }
        }
        print("키보드업")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if isDown == false {
            UIView.animate(withDuration: 0.3) {
                self.titleView.frame.origin.y += 100
                self.isDown = true
            }
        }
        print("키보드다운")
        return true
        
    }
    

}

