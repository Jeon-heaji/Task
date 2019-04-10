//
//  ThirdViewController.swift
//  LoginPageViewController
//
//  Created by Jeon-heaji on 06/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
// 회원가입View
class JoinViewController: UIViewController, UITextFieldDelegate {
   
    //view
    var titleView = UIView()
    var buttonView = UIView()

    //label
    let joinTextField = UITextField()
    let idLabel = UILabel()
    let pwLabel = UILabel()
    // image
    let fastCampusImage = UIImageView()
    let idImage = UIImageView()
    let pwImage = UIImageView()
    let joinImage = UIImageView()
    //textField
    var newIdTextField = UITextField()
    var newPwTextField = UITextField()
    // 중복체크,확인버튼
    let overlapIdCheckButton = UIButton()
    let checkButton = UIButton()
    let storeButton = UIButton()
    // 키보드up,down 글자수...16 4부터는 어떻게하지??
    var isDown = true
    var limitLength = 16
    //uitype?
//    let idpass =
    
    // join -> id..pw
    let userD = UserDefaults.standard
    var temp1 = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewConfiguration()
        
        joinTextField.delegate = self
        newIdTextField.delegate = self
        newPwTextField.delegate = self

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        newIdTextField.text = temp1
        newPwTextField.text = temp1
        joinTextField.text = temp1
    }
    
    func viewConfiguration() {
        //titleView - containerView
        titleView.frame = CGRect(x: 20, y: 20, width: view.frame.width - 20, height: 600)
        titleView.backgroundColor = .white
        view.addSubview(titleView)
        
        //festCampusuiImageView
        fastCampusImage.frame = CGRect(x: 50, y: 90, width: 270, height: 60)
        fastCampusImage.image = UIImage(named: "fastcampus_logo")
        titleView.addSubview(fastCampusImage)
        
        //joinTextField
        joinTextField.frame = CGRect(x: 100, y: 190, width: 150, height: 40)
        joinTextField.placeholder = "이름"
        joinTextField.becomeFirstResponder()
        titleView.addSubview(joinTextField)
        
        //joinImage - titleView
        joinImage.frame = CGRect(x: 40, y: 200, width: 28, height: 25)
        joinImage.image = UIImage(named: "user")
        titleView.addSubview(joinImage)
        //idImage - titleView
        idImage.frame = CGRect(x: 40, y: 280, width: 28, height: 25)
        idImage.image = UIImage(named: "email")
        titleView.addSubview(idImage)
        
        //pwImage - titleView
        pwImage.frame = CGRect(x: 40, y: 360, width: 28, height: 25)
        pwImage.image = UIImage(named: "password")
        titleView.addSubview(pwImage)
        
        //newIdTextField
        newIdTextField.frame = CGRect(x: 100, y: 280, width: 120, height: 40)
        newIdTextField.placeholder = "아이디"
        titleView.addSubview(newIdTextField)
        
        //newPwTextField
        newPwTextField.frame = CGRect(x: 100, y: 360, width: 120, height: 40)
        newPwTextField.placeholder = "비밀번호"
        newPwTextField.isSecureTextEntry = true
        titleView.addSubview(newPwTextField)

        //overlapIdCheckButton
        overlapIdCheckButton.frame = CGRect(x: 250, y: 280, width: 70, height: 40)
        overlapIdCheckButton.setTitle("중복확인", for: .normal)
        overlapIdCheckButton.setTitleColor(.gray, for: .normal)
        overlapIdCheckButton.addTarget(self, action: #selector(overlapCKFunc(_:)), for: .touchUpInside)
        titleView.addSubview(overlapIdCheckButton)
        
        // checkButton
        checkButton.frame = CGRect(x: 210, y: 450, width: 130, height: 50)
        checkButton.setTitle("완료", for: .normal)
        checkButton.addTarget(self, action: #selector(checkFunc(_:)), for: .touchUpInside)
        checkButton.layer.cornerRadius = 10
        checkButton.backgroundColor = .lightGray
        checkButton.setTitleColor(.white, for: .normal)
        titleView.addSubview(checkButton)
        
        //storeButton
        storeButton.frame = CGRect(x: 40, y: 450, width: 130, height: 50)
        storeButton.setTitle("저장", for: .normal)
        storeButton.addTarget(self, action: #selector(storeFunc(_:)), for: .touchUpInside)
        storeButton.layer.cornerRadius = 10
        storeButton.backgroundColor = .lightGray
        storeButton.setTitleColor(.white, for: .normal)
        titleView.addSubview(storeButton)

    }

    // 중복확인 - alert창
    @objc func overlapCKFunc(_ sender: UIButton) {
        let alert = UIAlertController(title: "알림", message: "중복확인", preferredStyle: .alert)
        let ckAlert = UIAlertAction(title: "확인", style: .default) { _ in
            if self.newIdTextField.text != "" {
                print("중복x")
            }
        }
        let cancelAlert = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ckAlert)
        alert.addAction(cancelAlert)
        present(alert, animated: true)
     
    }
    // 저장함수
    @objc func storeFunc(_ sender: UIButton) {

//        guard let id = newPwTextField.text, !id.isEmpty else { return }
//        guard let pw = newPwTextField.text, !pw.isEmpty else { return }
//        print(newIdTextField.text?.isEmpty)
        
        guard let id = newIdTextField.text, id.isEmpty == false else {return}
        guard let pw = newPwTextField.text, pw.isEmpty == false else {return}
        
        var tempDict: [String: String] = [:]
        tempDict[id] = pw   // user3
        
        let tempUser = userD.object(forKey: "users") as? [String: String] ?? [:]
        // user1 + user2
        
        for (key, value) in tempUser {    //user1, user2
            tempDict[key] = value
         
            // dict[0] = 1
            // dict[0] = 2
            // dict[1] = 3
            // user3,   + (user1, user2)
        }
        // user3,   + (user1, user2)
        
        userD.set(tempDict, forKey: "users")
        print(tempDict)
     
        /*
         1. 유저 없을 때 - user1의 아이디랑 비밀번호를 저장
         2. 유저1만 저장된 상태 - tempUser: user1,  tempDict: user2
         3. 유저1,2가 저장된 상태 - tempDict
         
         UserDefaults - user1, user2, user3
 */
         self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    // dismiss, alert
    @objc func checkFunc(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
   
    }
    
    func alert(_ sender: UIAlertController) {
        let join = UIAlertController(title: "가입완료!", message: "가입이 완료되었습니다.", preferredStyle: .alert)
        let ck = UIAlertAction(title: "확인", style: .default) { _ in
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        join.addAction(ck)
        present(join, animated: true)
    }
    
  //키보드 올라올때
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if isDown == true {
            UIView.animate(withDuration: 0.3) {
                self.titleView.frame.origin.y -= 40
                self.isDown = false
            }
        }
        print("키보드올라옴")
        return true
        
    }
    // 키보드 내려올때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if isDown == false {
            UIView.animate(withDuration: 0.3) {
                self.titleView.frame.origin.y += 40
                self.isDown = true
            }
        }
        joinTextField.resignFirstResponder()
        newIdTextField.resignFirstResponder()
        newPwTextField.resignFirstResponder()
        print("키보드내려감")
        return true
    }
    // 텍스트필드 글자수제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= limitLength
    }

}
