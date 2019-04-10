//
//  SecondViewController.swift
//  20190402_과제2
//
//  Created by Jeon-heaji on 02/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    // image사진 받아올 변수, 전체 count +1 증가할 변수 설정
    var animal = ""
    var count = 0
    
    // imageView -> IBOutlet  imageView1
    @IBOutlet weak var imageView1: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.image = UIImage(named: animal)
    }

    // countButton 을 눌렀을때 count는 1씩 증가
    @IBAction func countButton(_ sender: Any) {
        count += 1
      

    }

}
