//
//  MainVC.swift
//  FirstCitizenLayout
//
//  Created by Jeon-heaji on 28/09/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import SnapKit

// MARK: -  그냥 넘어가는 뷰에여
class MainVC: UIViewController {
  
  let LocationVC = LocationWithAddVC()
  
  lazy var button: UIButton = {
    let btn = UIButton(type: .system)
    btn.setTitle("Click", for: .normal)
    btn.setTitleColor(.red, for: .normal)
    btn.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    return btn
  }()
  

    override func viewDidLoad() {
        super.viewDidLoad()
      addSubViews()
      setupSNP()
      
    }
  
  private func addSubViews() {
    [button].forEach { view.addSubview($0) }
    
  }
  
  private func setupSNP() {
    button.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
    
  }
  
  @objc private func didTapButton(_ sender: UIButton) {
    navigationController?.pushViewController(LocationVC, animated: true)
  }
    
}
