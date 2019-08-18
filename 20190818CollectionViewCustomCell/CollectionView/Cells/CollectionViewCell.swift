import UIKit

class CollectionViewCell: UICollectionViewCell {

  // 셀 자체가 셋업시키도록 하기 위해서 private으로 설정
	@IBOutlet private weak var titleLabel:UILabel!
	@IBOutlet private weak var selectionImage:UIImageView!
  @IBOutlet private weak var mainImage: UIImageView!
	
	var isEditing: Bool = false {
		didSet {
			selectionImage.isHidden = !isEditing
		}
	}
	
  // 셀을 담당하는 공원 정보가 바뀔때,이미지 및 텍스트 바뀜
  var park: Park? {
    didSet {
      // nil값이 아닐때
      if let park = park {
        mainImage.image = UIImage(named: park.photo)
        titleLabel.text = park.name
      }
    }
  }
  
  // 셀이 재사용될때, 오류같은 것 막기위해서 이미지 없애기
  override func prepareForReuse() {
    mainImage.image = nil
  }
 
	override var isSelected: Bool {
		didSet {
			if isEditing {
				selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
			}
		}
	}
}
