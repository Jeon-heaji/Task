//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    let tableView = UITableView()
    
    var data = Array(1...40)
    var randomNum: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        tableView.dataSource = self
        
    }
    
   private func setupTableView() {
        
        tableView.frame = view.frame
        view.addSubview(tableView)
        
        
        // navigationitem 연결해서
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(reloadData))
        
        // refreshControl
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing..." )
    
    
        // rowHeight -> 모든 셀의 높이를 동일하게 할때 ,셀의 높이를 각각 다르게 할때 -> delegate 이용 -> heightForRowAt 이용
        tableView.rowHeight = 60
        tableView.refreshControl = refreshControl
    }
    
    @objc func reloadData() {
        data = []
        var count = 0
        while true {
            if let num = (1...90).randomElement() {
                if data.contains(num) == false {
                    data += [num]
                    count += 1
                }
                if count == 20 {
                    break
                    
                }
            }
        }
        
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        
        return cell
    }
}
