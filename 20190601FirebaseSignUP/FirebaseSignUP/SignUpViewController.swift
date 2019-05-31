//
//  SignUpViewController.swift
//  FirebaseSignUP
//
//  Created by Jeon-heaji on 31/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

        // signup
    	
    	let signUpLabel: UILabel = {
			let signUpLabel = UILabel()
			signUpLabel.textAlignment = .center
			signUpLabel.text = "회원가입!"
			signUpLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
			signUpLabel.translatesAutoresizingMaskIntoConstraints = false
			signUpLabel.textColor = .darkGray
			return signUpLabel
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
        
        let ckButton: UIButton = {
            let ckButton = UIButton(type: .system)
            ckButton.translatesAutoresizingMaskIntoConstraints = false
            ckButton.setTitle("회원가입", for: .normal)
            ckButton.setTitleColor(.gray, for: .normal)
            ckButton.addTarget(self, action: #selector(signUPBtnAction(_:)), for: .touchUpInside)
            ckButton.layer.borderWidth = 0.5
            ckButton.layer.cornerRadius = 10
            ckButton.layer.borderColor = UIColor.gray.cgColor
            return ckButton
            
        }()
        
        let cancelButton: UIButton = {
            let cancelButton = UIButton(type: .system)
            cancelButton.translatesAutoresizingMaskIntoConstraints = false
            cancelButton.setTitle("취소", for: .normal)
            cancelButton.setTitleColor(.gray, for: .normal)
            cancelButton.addTarget(self, action: #selector(cancelBtnAction(_:)), for: .touchUpInside)
            cancelButton.layer.borderWidth = 0.5
            cancelButton.layer.cornerRadius = 10
            cancelButton.layer.borderColor = UIColor.gray.cgColor
            return cancelButton
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
			view.addSubview(signUpLabel)
            view.addSubview(idTextField)
            view.addSubview(pwTextField)
            view.addSubview(idLabel)
            view.addSubview(pwLabel)
            view.addSubview(ckButton)
            view.addSubview(cancelButton)
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
				
				signUpLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 60),
				signUpLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
				signUpLabel.widthAnchor.constraint(equalToConstant: 200),
				
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
                
                ckButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 50),
                ckButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 100),
                ckButton.widthAnchor.constraint(equalToConstant: 100),
				
                cancelButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 50),
                cancelButton.leadingAnchor.constraint(equalTo: ckButton.trailingAnchor, constant: 30),
                cancelButton.widthAnchor.constraint(equalToConstant: 100),
				
                ])
            
        }
        
        @objc func signUPBtnAction(_ sender: UIButton) {
            let loginVC = LoginViewController()
            Auth.auth().createUser(withEmail: idTextField.text!, password: pwTextField.text!
                
            ) { (user, error) in
                
                if user !=  nil {
                    print("register success")
                    self.present(loginVC, animated: true)
                }
                else {
                    print("register failed")
                    
                }
            }
        }
        @objc func cancelBtnAction(_ sender: UIButton) {
            dismiss(animated: true)
        }

}
