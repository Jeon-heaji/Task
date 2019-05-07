//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.layer.masksToBounds = true
    
  }
     var isQuadruple = false
    @IBAction func handTapGesture(_ sender: UITapGestureRecognizer) {
        print("Double Tapped")
       
        if !isQuadruple {
        imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)  // x,y 를 2배씩 늘려주겠다. 3차행렬로 동장
        } else {
            imageView.transform = CGAffineTransform.identity         // identity는 단위행렬로 만든러준다.
        }
        isQuadruple.toggle()
    }
    
        // 옵션키 누르고 클릭
    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
      // 이미지뷰의 트렌스폼이 제일 처음에 단위행렬값이 행렬값이 바뀌게 되는데 거기에바뀐상태에서 또 바뀌게 되느냐
        // 단위 행렬은 1'
        // scaled가 같이 사용되게하려면 첫번째 방식으로 사용해야함.
        imageView.transform = imageView.transform.rotated(by: rotation)
        sender.rotation = 0
        
        // 기본값에다가 바뀐값을 넣어주는지??
//        imageView.transform = CGAffineTransform.identity.rotated(by: rotation)
    }
    
    @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            imageView.image = UIImage(named: "cat1")
        case .left:
            imageView.image = UIImage(named: "cat2")
        default:
            break
        }
    }
    
    
}
