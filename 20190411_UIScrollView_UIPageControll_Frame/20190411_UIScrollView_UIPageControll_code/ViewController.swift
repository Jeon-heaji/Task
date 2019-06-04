//
//  ViewController.swift
//  20190411_UIScrollView_UIPageControll_code
//
//  Created by Jeon-heaji on 12/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//
// 20190411 과제 code로 frame잡아서 실행


import UIKit

class ViewController: UIViewController{
    
    let scrollView = UIScrollView()
    let redView = UIView()
    let blueView = UIView()
    let greenView = UIView()
    let yellowView = UIView()
    
    let pageController = UIPageControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfiguration()
        scrollView.delegate = self
        
        scrollView.isPagingEnabled = true
        
    }
    
    func viewConfiguration() {
        
        let width1 = view.frame.width
        let height1 = view.frame.height
        
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.width * 4, height: view.frame.height)
        
        view.addSubview(scrollView)
        
        blueView.frame = CGRect(x: 0, y: 0, width: width1 , height: height1)
        blueView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        scrollView.addSubview(blueView)
        
        greenView.frame = CGRect(x: blueView.frame.maxX, y: 0, width: width1, height: height1)
        greenView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        scrollView.addSubview(greenView)
        
        redView.frame = CGRect(x: greenView.frame.maxX, y: 0, width: width1, height: height1)
        redView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        scrollView.addSubview(redView)
        
        yellowView.frame = CGRect(x: redView.frame.maxX, y: 0, width: width1, height: height1)
        yellowView.backgroundColor = #colorLiteral(red: 1, green: 0.9709396149, blue: 0.5619507401, alpha: 1)
        scrollView.addSubview(yellowView)
        
        pageController.frame = CGRect(x: 140, y: 750, width: 140, height: 50)
        pageController.currentPageIndicatorTintColor = .white
        pageController.pageIndicatorTintColor = .black
        pageController.numberOfPages = 4
        pageController.currentPage = 0
        view.addSubview(pageController)
    }
    
    
    
}
//ScrollViewDelegate -> scrollViewDidScroll  print찍어서 확인해보기!
extension ViewController: UIScrollViewDelegate {
    //    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    //        print("Deceletating :", scrollView.contentOffset)
    //        let setPoint = scrollView.contentOffset.x / view.frame.width
    //        pageController.currentPage = Int(setPoint)
    //    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scroll :", scrollView.contentOffset)
        let setPoint = scrollView.contentOffset.x / view.frame.width
        pageController.currentPage = Int(setPoint)
    }
}


