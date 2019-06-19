//
//  MenuView.swift
//  CustomTabBarExample
//
//  Created by Jeon-heaji on 19/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    let pageCollectionView: UICollectionView = {
        // flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        // not show scroll indicator
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.isPagingEnabled = true
        collectionView.allowsSelection = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let menuBar = MenuBar()
    
    var menuTitles = [String]() {
        didSet {
            menuBar.menuTitles = menuTitles
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCustomTabBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureCustomTabBar(){
        
        menuBar.delegate = self
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(menuBar)
        addSubview(pageCollectionView)
        
        menuBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // delegation
        pageCollectionView.dataSource = self
        pageCollectionView.delegate = self
        
        // register
        pageCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        
        // layout
        pageCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}


extension MenuView: MenuBarDelegate {
    func menuBarDidSelected(_ indexPath: IndexPath) {
        pageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension MenuView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.label.text = menuTitles[indexPath.row]
        return cell
    }
    
    
}

extension MenuView: UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.indicatorBarLeadingConstraint.constant = scrollView.contentOffset.x / CGFloat(menuTitles.count)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x)
        let itemAt = Int(targetContentOffset.pointee.x / self.frame.width)
        print(itemAt)
        menuBar.menuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension MenuView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height - menuBar.frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
