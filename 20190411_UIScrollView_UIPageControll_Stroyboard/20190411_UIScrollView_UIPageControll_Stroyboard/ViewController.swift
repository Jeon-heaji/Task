//
//  ViewController.swift
//  20190411_UIScrollView_UIPageControll_Stroyboard
//
//  Created by Jeon-heaji on 12/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var uiScrollView: UIScrollView!
    
    @IBOutlet weak var pageControll: UIPageControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate = self
        uiScrollView.delegate = self
        // 1페이지씩 이동하게.. 중간에 멈추지 않게함
        uiScrollView.isPagingEnabled = true
    }
   
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let setPoint = uiScrollView.contentOffset.x / uiScrollView.frame.width
        pageControll.currentPage = Int(setPoint)
        
    }
}
