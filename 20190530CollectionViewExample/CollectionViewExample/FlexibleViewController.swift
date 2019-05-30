//
//  FlexibleViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 30/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class FlexibleViewController: UIViewController {
    
    private enum UI {
        static let itemsInLine: CGFloat = 4
        static let linesOnScreen: CGFloat = 4
        static let itemSpacing: CGFloat = 10.0
        static let lineSpacing: CGFloat = 10.0
        static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        
        static let nextOffset: CGFloat = 0
    }
    
    // 1. lineOnScreen 속성 적용하기
    // [ 도전과제 ]
    // 2. nextOffset
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame,
                                               collectionViewLayout: layout)
    var parkImages = ParkManager.imageNames(of: .nationalPark)
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationItem()
    }
    
    // MARK: Setup CollectionView
    
    func setupCollectionView() {
        collectionView.register(
            CustomCell.self,
            forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
//        setupFlowLayout()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setupFlowLayout()
    }
    
    // MARK: Setup FlowLayout
    // 우선순위 -> inset -> itemSize(cellSize) -> linespacing, InterItemSpacing
    func setupFlowLayout() {
        layout.minimumInteritemSpacing = UI.itemSpacing
        layout.minimumLineSpacing = UI.lineSpacing
        layout.sectionInset = UI.edgeInsets
         // 1라인에 3개들어있음 아이템간의 간격 가로 스페이싱  버티컬
        let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1)
        // 추가
        let linesOnScreen = UI.lineSpacing * (UI.linesOnScreen - 1)
        // linesOnScreen -> item 세로 스페이싱 -> 호리젠탈일때
        // 가로 라인
        let horizontalInset = UI.edgeInsets.left + UI.edgeInsets.right
        let verticalInset = UI.edgeInsets.top + UI.edgeInsets.bottom + view.safeAreaInsets.top + view.safeAreaInsets.bottom

        
        if layout.scrollDirection == .vertical {
//            let horizontalSpacing = itemSpacing + horizontalInset
            let horizontalSpacing = linesOnScreen + horizontalInset
            let width = (collectionView.frame.width - horizontalSpacing) / UI.itemsInLine
            // 추가
            let verticalSpacing = linesOnScreen + verticalInset + UI.nextOffset
            let height = (collectionView.frame.height - verticalSpacing) / UI.linesOnScreen
            // 추가
            let rounded1 = width.rounded(.down)  // 소수점 내림
            let rounded2 = height.rounded(.down)
            layout.itemSize = CGSize(width: rounded1, height: rounded2)
            
        } else {
            let verticalSpacing = linesOnScreen + verticalInset
            let height = (collectionView.frame.height - verticalSpacing) / UI.itemsInLine
            
            let horizontalSpacing = linesOnScreen + horizontalInset + UI.nextOffset
            let width = (collectionView.frame.width - horizontalSpacing) / UI.linesOnScreen
            let rounded1 = height.rounded(.down)  // 소수점 내림
            let rounded2 = width.rounded(.down)
            layout.itemSize = CGSize(width: rounded2, height: rounded1)
        }
        
    }
    
    // MARK: Setup NavigationItem
    
    func setupNavigationItem() {
        let changeDirection = UIBarButtonItem(
            barButtonSystemItem: .reply,
            target: self,
            action: #selector(changeCollectionViewDirection(_:))
        )
        navigationItem.rightBarButtonItems = [changeDirection]
    }
    
    // MARK: - Action Handler
    
    @objc private func changeCollectionViewDirection(_ sender: Any) {
        
        let current = layout.scrollDirection
        layout.scrollDirection = current == .horizontal ? .vertical : .horizontal
        
        setupFlowLayout()
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension FlexibleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parkImages.count * 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCell.identifier,
            for: indexPath
            ) as! CustomCell
        let item = indexPath.item % parkImages.count
        cell.configure(
            image: UIImage(named: parkImages[item]),
            title: parkImages[item])
        cell.backgroundColor = .black
        
        return cell
    }
    
}
