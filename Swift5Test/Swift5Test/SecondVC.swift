//
//  SecondVC.swift
//  Swift5Test
//
//  Created by VIVA_DEV_IOS on 2019/10/22.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import SnapKit


class SecondVC: UIViewController {
  
  lazy var myView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.clipsToBounds = true
//    view.roundCorners([.layerMaxXMaxYCorner, .layerMinXMinYCorner,], radius: 50, borderColor: UIColor.green, borderWidth: 1)
    view.roundCorners([.layerMinXMaxYCorner, .layerMaxXMinYCorner], radius: 50, borderColor: UIColor.green, borderWidth: 1)
    return view
  }()
  

//  private let gradient: CAGradientLayer = {
//      let layer = CAGradientLayer()
//      let topColor: UIColor = UIColor(red:0.98, green:0.96, blue:0.93, alpha:0.5)
//      let bottomColor: UIColor = UIColor.white
//      layer.colors = [topColor.cgColor, bottomColor.cgColor]
//      layer.locations = [0,1]
//      return layer
//  }()
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setGradientBackground()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.addSubview(myView)
    
    myView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview()
      $0.width.height.equalTo(200)
    }

  }
  
 func setGradientBackground() {
  let colorTop = UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
  let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor

      let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [colorTop, colorBottom]
      gradientLayer.locations = [0.0, 1.0]
      gradientLayer.frame = self.view.bounds

      self.view.layer.insertSublayer(gradientLayer, at:0)
  }
  
}
