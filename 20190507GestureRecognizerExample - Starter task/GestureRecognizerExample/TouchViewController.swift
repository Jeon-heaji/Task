//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    var isHoldingImage = false
    var savePoint: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        //    imageView.layer.masksToBounds = true
        
        // 위에 masksToBounds 와 같음, 자신의 영역을 벗어나는 것은 잘라버리는
        imageView.clipsToBounds = true
        
    }
    // 탭 -> 몇번눌렀는지,  touch는 손가락갯수
    // 제일처음 touch를 인식하는 시점
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)     // 해당 좌표를 알 수 있다.
        
        print(touchPoint)
        if imageView.frame.contains(touchPoint) {       // 처음에 눌린 지점이 이미지영역안에 있는지
            imageView.image = UIImage(named: "cat2")
            isHoldingImage = true
            savePoint = touchPoint  // 처음에 눌린값을 savePoint에 저장 해둠 -> 처음눌린값
        }
        
    }
    
    // touchesBegan 이후에 바로 실행됨 이어서
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard isHoldingImage, let touch = touches.first else { return }     // 이미지안에있으면 true
        let touchPoint = touch.location(in: touch.view)
//        imageView.frame.origin = .zero
//        imageView.frame.origin = touchPoint
//        imageView.center = touchPoint
        print("imageView.center.x: \(imageView.center.x) (touchPoint.x - savePoint.x): \(touchPoint.x - savePoint.x)")
        
        imageView.center.x = imageView.center.x + (touchPoint.x - savePoint.x)   //이미지뷰의중앙+(지금움직이는값 - 처음눌린값)
        imageView.center.y = imageView.center.y + (touchPoint.y - savePoint.y)
        print("1:",savePoint)
        savePoint = touchPoint
//        print("2:",savePoint)
    }
    
    // 손가락을땠을때 , 화면밖을 벗어나거나
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat1")
        }
        isHoldingImage = false
        print("touchesEnded")
    }
    // 시스템에서 방해받는 상황이 나왔을때, 터치하는 도중에 상위 뷰에서 리무브되었을때
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        isHoldingImage = false
        
        print("touchesCancelled")
    }
}



