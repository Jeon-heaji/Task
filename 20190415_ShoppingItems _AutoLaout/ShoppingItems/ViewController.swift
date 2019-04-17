//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var iPhoneData: [String:[String: Int]] = [:]
    var tempTitle: [String] = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        iPhoneData = [
            "iPhone8": ["max": 15, "select": 0],
            "iPhone8_1": ["max": 15, "select": 0],
            "iPhone8_2": ["max": 15, "select": 0],
            "iPhoneSE(Gold)": ["max": 5, "select": 0],
            "iPhoneSE(Gold)_1": ["max": 5, "select": 0],
            "iPhoneSE(Gold)_2": ["max": 5, "select": 0],
            "iPhoneSE(RoseCold)": ["max": 5, "select": 0],
            "iPhoneSE(RoseCold)_1": ["max": 5, "select": 0],
            "iPhoneSE(RoseCold)_2": ["max": 5, "select": 0],
            "iPhoneX(White)": ["max": 10, "select": 0],
            "iPhoneX(White)_1": ["max": 10, "select": 0],
            "iPhoneX(White)_2": ["max": 10, "select": 0],
            "iPhoneX(SpaceGray)": ["max": 10, "select": 0],
            "iPhoneX(SpaceGray)_1": ["max": 10, "select": 0],
            "iPhoneX(SpaceGray)_2": ["max": 10, "select": 0]
        ]
        tempTitle = iPhoneData.keys.shuffled()
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        tableView.rowHeight = 100
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iPhoneData.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {return UITableViewCell()}
        
        print(indexPath)
        
        cell.amountButton.tag = indexPath.row
        cell.delegate = self
        cell.imgView.image = UIImage(named: tempTitle[indexPath.row])
        cell.iPhoneLabel.text = "\(tempTitle[indexPath.row])"
        cell.countLabel.text = "\(iPhoneData[tempTitle[indexPath.row]]!["select"]!)"
        
        return cell
    }
}

extension ViewController: ItemCellDelegate {
    func aItemCell(_ itemCell: ItemCell, didTapButton button: UIButton) {
        if let indexPath = tableView.indexPath(for: itemCell) {
            // 버튼이 눌러진 itemCell의 정보를 가져와서 tableView의 indexPath가 어디에 해당하는지 알아오는 작업
            if iPhoneData[tempTitle[indexPath.row]]!["max"]! > iPhoneData[tempTitle[indexPath.row]]!["select"]! {
                iPhoneData[tempTitle[indexPath.row]]!["select"]! += 1
                itemCell.countLabel.text = "\(iPhoneData[tempTitle[indexPath.row]]!["select"]!)"
            } else {
                let alert = UIAlertController(title: "경고", message: "재고가 없습니다.", preferredStyle: .alert)
                let ckAlert = UIAlertAction(title: "확인", style: .default)
                
                UIView.animate(withDuration: 1, animations: {
                    itemCell.backgroundColor = .red
                    itemCell.backgroundColor = .red
                    
                }) { (true) in
                    itemCell.backgroundColor = .white
                    itemCell.backgroundColor = .white
                }
                
                present(alert, animated: true)
                alert.addAction(ckAlert)
                
            }
        }
    }
}
