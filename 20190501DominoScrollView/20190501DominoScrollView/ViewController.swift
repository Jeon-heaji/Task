//
//  ViewController.swift
//  Domino
//
//  Created by Jeon-heaji on 01/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        configuration()
        autoLayout()
    }
    
    private func autoLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }
    
    func configuration() {
        var labels: [UILabel] = []
        for i in 0..<menuData.count {
            let sectionLabel = UILabel()
            sectionLabel.backgroundColor = .lightGray
            sectionLabel.text = menuData[i].category
            sectionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            labels.append(sectionLabel)
            
            for j in 0..<menuData[i].menu.count {
                let cellLabel = UILabel()
                cellLabel.text = menuData[i].menu[j].name
                cellLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
                labels.append(cellLabel)
            }
        }
        labels.forEach{
            scrollView.addSubview($0)
            let guide = view.safeAreaLayoutGuide
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            $0.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        }
        
        for z in 0..<labels.count {
            switch z {
            case 0:
                labels[0].topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            case labels.count - 1:
                labels[labels.count - 1].topAnchor.constraint(equalTo: labels[labels.count - 2].bottomAnchor).isActive = true
                labels[labels.count - 1].bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            default:
                labels[z].topAnchor.constraint(equalTo: labels[z - 1].bottomAnchor).isActive = true
                
            }
        }
    }
}

