//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :  0 부터  100 사이에 임의의 숫자
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     e.g
     섹션 0 - 0부터 9까지의 숫자  ->[0: [1, 2, 3, 4, 5, 6, 7, 8, 9]]
     섹션 1 - 10부터 19까지의 숫자 -> [1: [11, 12, 13, 14, 15, 16, 17, 18, 19]]
     ***************************************************/
    
    override var description: String {
        return "Practice 2 - Section"
    }
    
    //      let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    let data = Array(1...100)
    var numberCategories: [Int:[Int]] = [:] // 딕셔너리 [key: [value]]  키가있고, value는 배열
    var sectionTitles:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame)
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        // data를 10 개 단위로 나눠야 하니깐 i를 10으로 나누고 그 나눈값중 키, 밸류가 있으면 if문으로 없으면 else문으로
        // 일단 키를 찾으면 안에 밸류가 있는지 확인 가능하니깐.
        for i in data {
            if let _ = numberCategories[i / 10] {
                numberCategories[i / 10]!.append(i)
            } else {
                numberCategories[i / 10] = [i]
            } // 여기까지 value를 확인.
        } // 키를 담아야함
        sectionTitles = numberCategories.keys.sorted()
    }
}
// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // 섹션의 갯수
        return sectionTitles.count
        // sectionTitle은 딕셔너리키를 정렬한 것 이니깐 키의 갯수를 알수있다. numberCategories.keys.count 와같음
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 섹션안에 들어갈 행의 갯수
        
        return numberCategories[sectionTitles[section]]!.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(sectionTitles[section])"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        let key = sectionTitles[indexPath.section]
        let values = numberCategories[key]!
        let value = values[indexPath.row]
        cell.textLabel?.text = "\(value)"
        return cell
        
    }
}
