//
//  Extensions.swift
//  FirstCitizenLayout
//
//  Created by Jeon-heaji on 28/09/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation
import UIKit

// MARK: -  아 이거는 그 .. text 두께에여 
extension NSMutableAttributedString {
  
  func bold(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
    
    let attrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.boldSystemFont(ofSize: fontSize),

    ]
    self.append(NSMutableAttributedString(string: text, attributes: attrs))
    return self
    
  }
  
  
  func normal(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
  
    let attrs1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: fontSize),
                                                 ]
    self.append(NSMutableAttributedString(string: text, attributes: attrs1))
    
    return self
    
  }
  
  
}
