//
//  RoundCorners.swift
//  Swift5Test
//
//  Created by VIVA_DEV_IOS on 2019/10/22.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation
import UIKit



extension UIView {

  func roundCorners(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
      self.layer.maskedCorners = corners
      self.layer.cornerRadius = radius
      self.layer.borderWidth = borderWidth
      self.layer.borderColor = borderColor.cgColor

  }

}
