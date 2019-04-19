//
//  TableViewMultipleSelection.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//
//
import UIKit

final class TableViewMultipleSelection: UIViewController {

    /***************************************************
     [ 실습 - TableViewRefresh 기능을 이어서 수행 ]

     1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
     2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     (여기까지 TableViewRefresh 실습 내용과 동일)
     3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
     (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
     e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
     4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.

     < 힌트 >

     willSelectRow - scrollViewDelegate 참고, 선택 가능 여부
     selectedRow - tableView 속성, 현재 선택된 행
     multipleSelection - 다중 선택 가능 여부

     키워드 - willSelectRow, selectedRow, multipleSelection
     ***************************************************/
    
    override var description: String {
        return "Task 1 - MultipleSelection"
    }
    
    
    let tableView = UITableView()
    var data = Array(1...20)
    var tempData: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        tableView.dataSource = self
        tableView.delegate = self
       
     
    }
    // TableView
    private func setupTableView() {
        tableView.frame = view.frame
        tableView.allowsMultipleSelection = true
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.tintColor = .blue
        tableView.refreshControl = refreshControl
        
    }
    
    @objc func reloadData() {
        var count = 0
        tempData = []
        if let tvList = tableView.indexPathsForSelectedRows {
            for i in tvList {
                tempData += [data[i.row]]       // 배열 타입으로 맞춰서 넣어주기
            }
        }
        data = []
        data = tempData                         // 선택된 숫자를 data에 넣어준다
        
        count += data.count                     // 선택된 숫자만큼 카운트에 넣어주고 while문으로 돌릴때 그 카운트만큼만 돌고
                                                // 카운트에 1씩 증가 , 20이 됐을때 break
        while true {
            if let num = (1...70).randomElement() {
                if data.contains(num) == false {
                    data += [num]
                    count += 1
                }
            }
            if count == 20 {
                break
            }
                }
 
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension TableViewMultipleSelection: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}

extension TableViewMultipleSelection: UITableViewDelegate {

//        4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리. -> willSelectRowAt
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if data[indexPath.row] < 7 {
            return nil
        }
        return indexPath
    }
}
