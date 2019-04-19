//
//  ViewController.swift
//  LoginPageViewController
//
//  Created by Jeon-heaji on 05/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

@IBDesignable
class FirstViewController: UIViewController, UITextFieldDelegate {
    
    // view
    var titleView = UIView()
    var redView1 = UIView()
    var redView2 = UIView()
    var redView3 = UIView()
    var line1 = UIView()
    var line2 = UIView()
    // id,pw,image
    var loginView = UIView()
    // image
    let idImage = UIImageView()
    let pwImage = UIImageView()
    let fastCampusImage = UIImageView()
    // textfield
    var idTextField = UITextField()
    var pwTextField = UITextField()
    
    //button
    let signinButton = UIButton()
    let joinButton = UIButton()
    //email, pw
    var emailId = "Test"
    var pw = "1234"
    
    // 키보드 true or false
    var isDown = true
    // 글자수 제한
    var limitLength = 20
    // userD
    let userD1 = UserDefaults.standard
    //jVC
    let jVC = JoinViewController()
    //
    var temp = ""
    let sVC = SecondViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfiguration()
        
        idTextField.delegate = self
        pwTextField.delegate = self
      
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewConfiguration()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewConfiguration()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idTextField.text = temp
        pwTextField.text = temp
       
    }
    
    func viewConfiguration() {
        
        //titleView - containerView
        titleView.frame = CGRect(x: 20, y: 20, width: view.frame.width - 50, height: view.frame.height - 600)
        titleView.backgroundColor = .white
        view.addSubview(titleView)
        
        //redView 1,2,3 - titleView
        redView1.frame = CGRect(x: 130, y: 180, width: 30, height: 30)
        redView1.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.276720035, blue: 0.3107181458, alpha: 1)
        redView1.layer.cornerRadius = 10
        titleView.addSubview(redView1)
        
        redView2.frame = CGRect(x: 180, y: 180, width: 30, height: 30)
        redView2.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.276720035, blue: 0.3107181458, alpha: 1)
        redView2.layer.cornerRadius = 10
        titleView.addSubview(redView2)
        
        redView3.frame = CGRect(x: 230, y: 180, width: 30, height: 30)
        redView3.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.276720035, blue: 0.3107181458, alpha: 1)
        redView3.layer.cornerRadius = 10
        titleView.addSubview(redView3)
        
        //festCampusuiImageView
        
        fastCampusImage.frame = CGRect(x: 50, y: 80, width: 270, height: 60)
        fastCampusImage.image = UIImage(named: "fastcampus_logo")
        titleView.addSubview(fastCampusImage)
        
        // loginView - containerView
        loginView.frame = CGRect(x: 20, y: 450, width: view.frame.width - 40, height: view.frame.height - 550)
        loginView.backgroundColor = .white
        view.addSubview(loginView)
        
        //idtextField - loginView
        idTextField.frame = CGRect(x: 90, y: 30, width: 250, height: 40 )
        idTextField.placeholder = "이메일을 입력하세요"
        idTextField.becomeFirstResponder()
        loginView.addSubview(idTextField)
        
        //pwtextField - loginView
        pwTextField.frame = CGRect(x: 90, y: 110, width: 250, height: 40)
        pwTextField.placeholder = "비밀번호를 입력하세요"
        pwTextField.isSecureTextEntry = true
        pwTextField.becomeFirstResponder()
        loginView.addSubview(pwTextField)
        
        //idImage - loginView
        idImage.frame = CGRect(x: 40, y: 50, width: 28, height: 25)
        idImage.image = UIImage(named: "email")
        loginView.addSubview(idImage)
        
        //pwImage - loginView
        pwImage.frame = CGRect(x: 40, y: 120, width: 28, height: 25)
        pwImage.image = UIImage(named: "password")
        loginView.addSubview(pwImage)
        
        //line 1,2 - loginView
        line1.frame = CGRect(x: 80, y: 80, width: 260, height: 1)
        line1.backgroundColor = .lightGray
        loginView.addSubview(line1)
        
        line2.frame = CGRect(x: 80, y: 150, width: 260, height: 1)
        line2.backgroundColor = .lightGray
        loginView.addSubview(line2)
        
        //signInButton - loginView
        signinButton.frame = CGRect(x: 30 , y: 170, width: 330, height: 45)
        signinButton.backgroundColor = .gray
        signinButton.setTitle("Sing In", for: .normal)
        signinButton.addTarget(self, action: #selector(signinFunc(_:)), for: .touchUpInside)
        signinButton.addTarget(self, action: #selector(alertController(_:)), for: .touchUpInside)
        signinButton.layer.cornerRadius = 10
        loginView.addSubview(signinButton)
        
        //joinButton - loginView
        joinButton.frame = CGRect(x: 250, y: 230, width: 100, height: 30)
        joinButton.backgroundColor = .lightGray
        joinButton.layer.cornerRadius = 10
        joinButton.setTitle("Join", for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        joinButton.addTarget(self, action: #selector(joinButtonFunc(_:)), for: .touchUpInside)
        loginView.addSubview(joinButton)
    }
    
    // signButton눌렀을때
    @objc func signinFunc(_ sender: UIButton) {
        guard let idText = idTextField.text, idText.isEmpty == false else {return}
        guard let pwText = pwTextField.text, pwText.isEmpty == false else {return}
        
        var resultDic: [String: String] = [:]
        resultDic[idText] = pwText
        
        let users = userD1.object(forKey: "users") as? [String: String] ?? [:]
        
        for (key, value) in users {
            resultDic[key] = value
            
            if idText == key && pwText == value {
                present(sVC, animated: true)
            }
            print(users)
        }
    }
  
    //키보드 올라올때
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if isDown == true {
            UIView.animate(withDuration: 0.5) {
                self.loginView.frame.origin.y -= 165
                self.isDown = false
            }
        }
        print("키보드올라옴")
        return true
        
    }
    // 키보드 내려갈때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if isDown == false {
            UIView.animate(withDuration: 0.5) {
                self.loginView.frame.origin.y += 165
                self.isDown = true
            }
        }
        
        self.idTextField.resignFirstResponder()
        self.pwTextField.resignFirstResponder()
        print("키보드내려감")
        return true
        
    }
    // textField 글자수제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newlength = text.count + string.count - range.length
        
        return newlength <= limitLength
      
    }
 
    // 경고창
    @objc func alertController(_ sender: UIAlertController) {
        let alert = UIAlertController(title: "경고", message: "아이디와 비밀번호를 확인하세요.", preferredStyle: .alert)
        let checkAlert = UIAlertAction(title: "확인", style: .default)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.idTextField.backgroundColor = .red
            self.pwTextField.backgroundColor = .red
        }) { (true) in
            self.idTextField.backgroundColor = .white
            self.pwTextField.backgroundColor = .white
        }
        
        present(alert, animated: true)
        alert.addAction(checkAlert)
    }
    
    //회원가입버튼 -> JoinView이동
    @objc func joinButtonFunc(_ sender: UIButton) {
        
        present(jVC, animated: true)
    }
  
}

