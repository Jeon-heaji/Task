//
//  FlowLayout.swift
//  CollectionView
//
//  Created by Brian on 7/18/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {

  //생성되는 아이템(한개씩)
  var addedItem: IndexPath?
  //지워지는 아이템 ---> 배열 (한꺼번에 지움)
  var deletedItems: [IndexPath]?
  
  
  // 1) 셀 생성할때(초기에 나타나는 듯 보이는) 애니메이션에 관한 메서드(크기, 위치, 다른 비쥬얼 속성)
  override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    
    // UICollectionViewLayoutAttributes(position of the Cell)
    // 예전 인덱스와 더해진 인덱스가 같지 않으면 ===> nil반환
    guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath), let added = addedItem, added == itemIndexPath else {
      return nil
    }
    
    // 처음 시작할때의 속성들 설정(Default로 설정)
    // addItem() 메서드의 첫 애니메이션이 적용될 효과들
    attributes.center = CGPoint(x: collectionView!.frame.width - 23.5, y: -24.5)
    attributes.alpha = 1.0
    attributes.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
    attributes.zIndex = 5  // 다른 모든 뷰들 위쪽으로 나타남
    
    return attributes
  }
  
  
  // 2) 셀 지울때(사라지듯 보이는) 애니메이션에 관한 메서드
  override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

    // UICollectionViewLayoutAttributes
    guard let attributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath), let deleted = deletedItems, deleted.contains(itemIndexPath) else {
      return nil
    }
    attributes.alpha = 1.0
    attributes.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    attributes.zIndex = -1
    return attributes
  }
  
  
  // 셀(및 보조뷰) 레이아웃 설정
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

    var result = [UICollectionViewLayoutAttributes]()
    if let attributes = super.layoutAttributesForElements(in: rect) {
      for item in attributes {
        let cellAttributes = item.copy() as! UICollectionViewLayoutAttributes
        if item.representedElementKind == nil {
          let frame = cellAttributes.frame
          cellAttributes.frame = frame.insetBy(dx: 2.0, dy: 2.0)
        }
        result.append(cellAttributes)
      }
    }
    return result
  }
  

}
