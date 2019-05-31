//
//  LoginSuccessViewController.swift
//  FirebaseSignUP
//
//  Created by Jeon-heaji on 30/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class LoginSuccessViewController: UIViewController {
//    let loginVC = LoginViewController()
    var nameString = ""
    
    let successLabel: UILabel = {
        let successLabel = UILabel()
        successLabel.textAlignment = .center
        successLabel.text = "로그인 성공!"
        successLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        successLabel.textColor = .darkGray
        return successLabel
    }()
    
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.setTitle("뒤로가기", for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(successLabel)
        view.addSubview(label)
        view.addSubview(button)
        label.text = nameString
        label.text = "\(nameString) 님 환영합니다!"
        autoLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = "\(nameString) 님 환영합니다!"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            successLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 60),
            successLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            successLabel.widthAnchor.constraint(equalToConstant: 200),
            
            label.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 120),
            label.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 70),
//            label.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            button.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            
            ])
    }


}
