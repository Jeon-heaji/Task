//
//  LoginViewController.swift
//  FirebaseSignUP
//
//  Created by Jeon-heaji on 30/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.textAlignment = .center
        loginLabel.text = "로그인!"
        loginLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.textColor = .darkGray
        return loginLabel
    }()
    let idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.placeholder = "아이디를 입력하세요"
        idTextField.borderStyle = .roundedRect
        idTextField.becomeFirstResponder()
        return idTextField
        
    }()
    let pwTextField: UITextField = {
        let pwTextField = UITextField()
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.placeholder = "비밀번호를 입력하세요"
        pwTextField.borderStyle = .roundedRect
        pwTextField.isSecureTextEntry = true
        return pwTextField
    }()
    
    let idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.text = "ID"
        idLabel.textColor = .gray
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        return idLabel
    }()
    
    let pwLabel: UILabel = {
        let pwLabel = UILabel()
        pwLabel.text = "PW"
        pwLabel.textColor = .gray
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        return pwLabel
    }()
    
    let loginBtn: UIButton = {
        let loginBtn = UIButton(type: .system)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.setTitleColor(.gray, for: .normal)
        loginBtn.addTarget(self, action: #selector(loginBtnAction(_:)), for: .touchUpInside)
        loginBtn.layer.borderWidth = 0.5
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.borderColor = UIColor.gray.cgColor
        return loginBtn
        
    }()
    
    let signUpBtn: UIButton = {
        let signUpBtn = UIButton(type: .system)
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.setTitle("회원가입", for: .normal)
        signUpBtn.setTitleColor(.gray, for: .normal)
        signUpBtn.addTarget(self, action: #selector(signupBtnAction(_:)), for: .touchUpInside)
        signUpBtn.layer.borderWidth = 0.5
        signUpBtn.layer.cornerRadius = 10
        signUpBtn.layer.borderColor = UIColor.gray.cgColor
        return signUpBtn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginLabel)
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(idLabel)
        view.addSubview(pwLabel)
        view.addSubview(loginBtn)
        view.addSubview(signUpBtn)
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idTextField.text = ""
        pwTextField.text = ""
        
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 60),
            loginLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            
            idLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 120),
            idLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
            idLabel.widthAnchor.constraint(equalToConstant: 50),
            
            idTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 120),
            idTextField.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 30),
            idTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            pwLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 50),
            pwLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
            pwLabel.widthAnchor.constraint(equalToConstant: 50),
            pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 50),
            pwTextField.leadingAnchor.constraint(equalTo: pwLabel.trailingAnchor, constant: 30),
            pwTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            
            loginBtn.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 50),
            loginBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 100),
            loginBtn.widthAnchor.constraint(equalToConstant: 100),
            
            signUpBtn.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 50),
            signUpBtn.leadingAnchor.constraint(equalTo: loginBtn.trailingAnchor, constant: 30),
            signUpBtn.widthAnchor.constraint(equalToConstant: 100),
            
            ])
        
    }
    
    @objc func loginBtnAction(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: idTextField.text!, password: pwTextField.text!) {
            (user, error) in
            let loginSVC = LoginSuccessViewController()
            if user != nil {
                print("login success")
                self.present(loginSVC, animated: true)
                if let text = self.idTextField.text {
                loginSVC.nameString = text
                }
            }
            else {
                print("login fail")
                let alert = UIAlertController(title: "입력하세요", message: "Login Fail", preferredStyle: .alert)
                let ck = UIAlertAction(title: "확인", style: .default)
                self.present(alert, animated: true)
                alert.addAction(ck)
                
            }
        }
    }
    @objc func signupBtnAction(_ sender: UIButton) {
        let signUpVC = SignUpViewController()
        present(signUpVC, animated: true)

    }
    
 
}
