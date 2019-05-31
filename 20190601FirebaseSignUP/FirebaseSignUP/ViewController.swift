//
//  ViewController.swift
//  FirebaseSignUP
//
//  Created by Jeon-heaji on 30/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    // signup
    let idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.placeholder = "아이디를 입력하세요"
        idTextField.borderStyle = .roundedRect
        return idTextField
        
    }()
    let pwTextField: UITextField = {
        let pwTextField = UITextField()
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.placeholder = "비밀번호를 입력하세요"
        pwTextField.borderStyle = .roundedRect
        return pwTextField
    }()
    
    let ckButton: UIButton = {
        let ckButton = UIButton(type: .system)
        ckButton.translatesAutoresizingMaskIntoConstraints = false
        ckButton.setTitle("확인", for: .normal)
        ckButton.setTitleColor(.gray, for: .normal)
        ckButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
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
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(ckButton)
        view.addSubview(cancelButton)
        autoLayout()
        
       
      
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50),
            idTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 50),
            idTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            
            pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 50),
            pwTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 50),
            pwTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            
            ckButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 50),
            ckButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 150),
            ckButton.widthAnchor.constraint(equalToConstant: 50),
            
            cancelButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 50),
            cancelButton.leadingAnchor.constraint(equalTo: ckButton.trailingAnchor, constant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            
            ])
        
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        let loginVC = LoginViewController()
        present(loginVC, animated: true)
    }
    @objc func cancelBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    


}

