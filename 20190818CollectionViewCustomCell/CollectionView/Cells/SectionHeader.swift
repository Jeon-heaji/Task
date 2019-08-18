//
//  SectionHeader.swift
//  CollectionView
//
//  Created by Brian on 7/18/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

// 섹션헤더를 커스텀하게 만들기 위해서
class SectionHeader: UICollectionReusableView {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var flagImage: UIImageView!
  @IBOutlet private weak var countLabel: UILabel!
  
  var section: Section! {
    didSet {
      titleLabel.text = section.title
      flagImage.image = UIImage(named: section.title ?? "")
      countLabel.text = "\(section.count)"
    }
  }
  
  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }
  
  var count: Int? {
    didSet {
      countLabel.text = "\(section.count)"
    }
  }
  
  
  
}
