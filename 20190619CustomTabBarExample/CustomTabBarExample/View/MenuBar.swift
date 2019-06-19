//
//  MenuBar.swift
//  CustomTabBarExample
//
//  Created by Jeon-heaji on 19/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class MenuBar: UIView {

  // MARK: - Properties
    
    let menuCollectionView: UICollectionView = {
       
        // flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collectionView
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    let indicatorBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    var menuTitles = [String]()
    var delegate: MenuBarDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionView()
        autolayout()
    }
    var indicatorBarLeadingConstraint: NSLayoutConstraint!
    
    private func configureCollectionView() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        // register
        menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        
    }
    
    private func autolayout() {
        addSubview(menuCollectionView)
        addSubview(indicatorBar)
        
        // collection view
        menuCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // indicatorBar
        indicatorBarLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: leadingAnchor)
        indicatorBarLeadingConstraint.isActive = true
        
        indicatorBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        indicatorBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.label.text = menuTitles[indexPath.row]
        
        return cell
    }
    
    
}

extension MenuBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // view controller -> indexPath를 전달해줌
        delegate?.menuBarDidSelected(indexPath)
        indicatorBarLeadingConstraint.constant = (self.frame.width / CGFloat(menuTitles.count)) * CGFloat(indexPath.row)
//        print((self.frame.width / CGFloat(menuTitles.count)) * CGFloat(indexPath.row))
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
    }
}

extension MenuBar: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / CGFloat(menuTitles.count), height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
}
