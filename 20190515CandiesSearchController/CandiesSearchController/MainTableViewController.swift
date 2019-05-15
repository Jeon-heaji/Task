//
//  MainTableViewController.swift
//  CandiesSearchController
//
//  Created by Wi on 13/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var candies = [Candy]()
    var filteredCandeies = [Candy]()    // 검색 된 애들을 넣을자리
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Setup Basic CearchController Setting
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        
        // Setup other SerchController Setting
        searchController.searchBar.placeholder = "Search Candy"
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
    
        candies =  [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear"),
            Candy(category:"Other", name:"Candy Floss"),
            Candy(category:"Chocolate", name:"Chocolate Coin"),
            Candy(category:"Chocolate", name:"Chocolate Egg"),
            Candy(category:"Other", name:"Jelly Beans"),
            Candy(category:"Other", name:"Liquorice"),
            Candy(category:"Hard", name:"Toffee Apple")]
        
        
        filteredCandeies = candies
    }
    

    // MARK: - Table view data source
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredCandeies.count // * 바뀐 부분
        
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredCandeies[indexPath.row].name
        cell.detailTextLabel?.text = filteredCandeies[indexPath.row].category
        return cell
    }
    
    
    // MARK: - For Search method
    
    func filterContentForSearchText(_ seachText: String, scope: String = "All") {
//        if searchBarIsEmpty() {
//            filteredCandeies = candies
//        } else {
//            filteredCandeies = candies.filter{      // 검색된애들이 있는지 확인하고 걸러서 안으로 들어옴
//                $0.name.contains(seachText)
//            }
//        }
//        tableView.reloadData()
        filteredCandeies = candies.filter {
            let doesCategoryMatch = (scope == "All") || ($0.category == scope)  // 조건을 변수에 담기
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && $0.name.lowercased().contains(seachText.lowercased())
                // 찾을때 소문자로 다 바꾸고 찾는 글씨도 소문자로 바꿈
                
            }
        }
        tableView.reloadData()
    }


    func searchBarIsEmpty() -> Bool {
        // searchBar의 text의 유무를 반환하고 만약 nil 이라면 true반환
        return searchController.searchBar.text?.isEmpty ?? true
    }

}
// 검색을 했을때 이쪽으로 들어온다.
extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
//        print("검색중")
        // 이 함수에 scope도 넣어줄꺼임
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        print("스코프가 눌렸음")
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        
        
    }
}
