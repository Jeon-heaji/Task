//
//  ViewController.swift
//  CocoapodExample
//
//  Created by Jeon-heaji on 31/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let bottomCircleView = UIView()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        snapKitExample()
        thenExample()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomCircleView.layer.cornerRadius = bottomCircleView.frame.width / 2
        
    }
    
    let labelThen = UILabel().then {
        $0.text = "WoW"
        $0.textAlignment = .center
        $0.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    }
    
    // Then
    func thenExample() {
        view.addSubview(labelThen)
        labelThen.snp.makeConstraints {
            $0.leading.top.trailing
            .equalTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
    
    
    
//
//    func snapKitExample() {
//        let squareView = UIView()
//        squareView.backgroundColor = .green
//        view.addSubview(squareView)
//
//        let topView = UIView()
//        topView.backgroundColor = .black
//        squareView.addSubview(topView)
//
//        let topLabel = UILabel()
//        topLabel.text = "TopView"
//        topLabel.textColor = .white
//        topLabel.textAlignment = .center
//        topLabel.font = UIFont.boldSystemFont(ofSize: 25)
//        topView.addSubview(topLabel)
//
//        let bottomView = UIView()
//        bottomView.backgroundColor = .red
//        squareView.addSubview(bottomView)
//
//        let bottomLabel = UILabel()
//        bottomLabel.text = "BottomView"
//        bottomLabel.textColor = .white
//        bottomLabel.textAlignment = .center
//        bottomLabel.font = UIFont.boldSystemFont(ofSize: 25)
//        bottomView.addSubview(bottomLabel)
//
//        bottomCircleView.backgroundColor = .cyan
//        view.addSubview(bottomCircleView)
//
//        // Setup Constraints
////        squareView.translatesAutoresizingMaskIntoConstraints = false
////        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//
//        // Snp
//        squareView.snp.makeConstraints {
//            $0.centerX.equalToSuperview()       //  부모뷰와 같이 맞추겠다
//            $0.centerY.equalToSuperview().offset(-40)
//            $0.width.equalToSuperview().multipliedBy(0.7)
//            $0.height.equalToSuperview().multipliedBy(0.4)
//        }
//        // black
//        topView.snp.makeConstraints {
//            $0.leading.trailing.top.equalToSuperview().inset(20)      // 부모뷰와 같이 맞추겠다
//        }
//
//        bottomView.snp.makeConstraints {
//            $0.top.equalTo(topView.snp.bottom)
//            $0.height.equalTo(topView)
//            $0.leading.bottom.trailing.equalToSuperview().inset(20)
//        }
//
//        topLabel.snp.makeConstraints {
////            $0.top.leading.bottom.trailing.equalToSuperview()   // 검정색이랑 같게하는것
//            $0.edges.equalToSuperview()         // edges 사용하면 위랑 같음
//        }
//        bottomLabel.snp.makeConstraints {
//            $0.width.height.equalTo(topLabel)
//            $0.leading.bottom.equalToSuperview()
//        }
//        bottomCircleView.snp.makeConstraints {
//            $0.top.equalTo(squareView.snp.bottom)
//            $0.centerX.equalTo(squareView)
//            $0.width.height.equalTo(squareView.snp.width).dividedBy(2)
//        }
//
//    }
    


}

