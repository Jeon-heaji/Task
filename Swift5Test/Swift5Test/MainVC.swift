//
//  MianVC.swift
//  Swift5Test
//
//  Created by Jeon-heaji on 2019/10/10.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
  
  private var stackView = UIStackView()
  private var firstStackView = UIStackView()
  private var secondStackView = UIStackView()
  private var thirdStackView = UIStackView()
  private var fourthStackView = UIStackView()
  
  
  let firstLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .yellow
    label.layer.cornerRadius = 5
    return label
  }()
  
  let secondLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .yellow
     label.layer.cornerRadius = 5
     return label
  }()
  
  let thirdLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .yellow
     label.layer.cornerRadius = 5
     return label
  }()
  
  let fourthLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .yellow
     label.layer.cornerRadius = 5
     return label
  }()
  
  let oneBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("1", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let twoBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("2", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let threeBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("3", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let fourBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("4", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let fiveBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("5", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let sixBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("6", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let sevenBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("7", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let eightBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("8", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let nineBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("9", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let zeroBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("0", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let deleteBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("⟵", for: .normal)
    button.setTitleColor(#colorLiteral(red: 44, green: 107, blue: 250, alpha: 1.0), for: .normal)
    return button
  }()
  let blankBtn: UIButton = {
    let button = UIButton(type: .system)
    return button
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      if #available(iOS 13.1, *) {
         self.view.backgroundColor = .systemGray
         print("run2")
       } else {
         self.view.backgroundColor = .white
       }
      
      setupStackView()
      addSubViews()
      setupSNP()
      

    }
  
  private func setupStackView() {
    // stackView
    stackView = UIStackView(arrangedSubviews: [firstLabel, secondLabel, thirdLabel, fourthLabel])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    
    // firstStackView
    firstStackView = UIStackView(arrangedSubviews: [oneBtn, twoBtn, threeBtn])
    firstStackView.axis = .horizontal
    firstStackView.distribution = .fillEqually
    firstStackView.spacing = 1
    
    //secondStackView
    secondStackView = UIStackView(arrangedSubviews: [fourBtn, fiveBtn, sixBtn])
    secondStackView.axis = .horizontal
    secondStackView.distribution = .fillEqually
    secondStackView.spacing = 1
    
    //thirdStackView
    thirdStackView = UIStackView(arrangedSubviews: [sevenBtn, eightBtn, nineBtn])
       thirdStackView.axis = .horizontal
       thirdStackView.distribution = .fillEqually
       thirdStackView.spacing = 1
    // fourthStackView
    fourthStackView = UIStackView(arrangedSubviews: [blankBtn, zeroBtn, deleteBtn])
       fourthStackView.axis = .horizontal
       fourthStackView.distribution = .fillEqually
       fourthStackView.spacing = 1
    
  }
  
  private func addSubViews() {
    [stackView,]// firstStackView, secondStackView, thirdLabel, fourthStackView]
      .forEach { view.addSubview($0) }
  }
  
  private func setupSNP() {
    stackView.snp.makeConstraints {
      
      $0.top.equalToSuperview().offset(200)
      $0.centerX.equalToSuperview()
    }
//    firstStackView.snp.makeConstraints {
//      $0.top.equalTo(stackView.snp.bottom).offset(100)
//      $0.centerX.equalToSuperview()
//    }
//    secondStackView.snp.makeConstraints {
//      $0.top.equalTo(firstStackView.snp.bottom).offset(1)
//      $0.centerX.equalToSuperview()
//    }
//    thirdStackView.snp.makeConstraints {
//         $0.top.equalTo(secondStackView.snp.bottom).offset(1)
//         $0.centerX.equalToSuperview()
//       }
//    fourthStackView.snp.makeConstraints {
//         $0.top.equalTo(thirdStackView.snp.bottom).offset(1)
//         $0.centerX.equalToSuperview()
//       }
    
  }
    

}
