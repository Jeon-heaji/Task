import UIKit

// 이미지 잘 보이게 하는 백 그라운드

class GradientView: UIView {
  
  lazy fileprivate var gradientLayer: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.colors = [UIColor.clear.cgColor, UIColor(white: 0.0, alpha: 0.75).cgColor]
    layer.locations = [NSNumber(value: 0.0 as Float), NSNumber(value: 1.0 as Float)]
    return layer
    }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = UIColor.clear
    layer.addSublayer(gradientLayer)
  }
  
  override func layoutSubviews() {
		super.layoutSubviews()
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		gradientLayer.frame = bounds
		CATransaction.commit()
  }
  
}
