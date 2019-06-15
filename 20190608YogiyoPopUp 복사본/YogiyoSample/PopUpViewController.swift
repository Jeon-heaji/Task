//
//  PopUpViewController.swift
//  YogiyoSample
//
//  Created by Jeon-heaji on 07/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//


import UIKit

class PopUpViewController: UIViewController {
    
    let images = ["yogiyo4", "yogiyo5"]
    
    let customView: PopUpView = {
        let customView = PopUpView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.dismissBtn.addTarget(self, action: #selector(dismissBtnAction(_:)), for: .touchUpInside)
        return customView
        
    }()
    
    let userD = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PopupVC")
        
        
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        view.addSubview(customView)
        
        customView.scrollView.delegate = self
        customView.scrollView.isPagingEnabled = true
        customView.pageController.numberOfPages = images.count
        customView.pageController.currentPage = 0
        autoLayout()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 팝업이 꺼졌을때
        print("view disappear")
        // 1. 현재 시간을 체크
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        // 2. 버튼의 체크 유무 저장 (유저디폴트)
        userD.setValue(customView.checkBtn.isSelected, forKey: "isRemind")
        print(customView.checkBtn.isSelected)
        // 3. 체크 시간 저장 (유저디폴트)
        userD.set(now, forKey: "date")
        print("date:", dateFormatter.string(from: now))
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: guide.topAnchor),
            customView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
    }
    
    @objc func dismissBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
extension PopUpViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = round(scrollView.contentOffset.x / self.view.frame.width)
        customView.pageController.currentPage = Int(CGFloat(currentPage))
    }
    
}
