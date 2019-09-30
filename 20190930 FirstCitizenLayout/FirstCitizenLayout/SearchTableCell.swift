//
//  SearchTableCell.swift
//  FirstCitizenLayout
//
//  Created by Jeon-heaji on 28/09/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import SnapKit

// MARK: - 혁태 메렁
class SearchTableCell: UITableViewCell {
  
  static let identifire = "SearchTableCell"

  // MARK: - 검색했을때 나오는 텍스트
  let searchBtn: UIButton = {
    let button = UIButton(type: .system)
    button.layer.borderWidth = 0.5
    button.layer.cornerRadius = 5
    return button
  }()
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.contentView.endEditing(true)
  }
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    addSubViews()
    setupSNP()
    
  }
  

  private func addSubViews() {
    [searchBtn].forEach
      { self.addSubview($0) }
  }
  
  private func setupSNP() {
    searchBtn.snp.makeConstraints {
      $0.top.equalToSuperview().offset(30)
      $0.leading.trailing.equalToSuperview().inset(25)
      $0.height.equalTo(40)
   
    }
  }
  
}
