//
//  MainTableViewController.swift
//  SearchViewControllerExample
//
//  Created by Wi on 11/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var menuDatas = menuData
    var menu = [MenuData]()
    var filteredMenuDatas = [Product]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Search"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "Search!"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = [
            "All", "슈퍼시드","클래식", "프리미엄", "사이드","음료", "피클소스"
        ]
        // 모든 데이터를 다 채워줌
        menuData.forEach{
            filteredMenuDatas += $0.menu
        }
        print(filteredMenuDatas)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMenuDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredMenuDatas[indexPath.row].name
        cell.detailTextLabel?.text = "\(filteredMenuDatas[indexPath.row].price)"
        return cell
    }

    // MARK: - For Search method
        
    func filterContentForSearchText(_ searchText: String, _ scope: String = "All") {
        filteredMenuDatas = []
     
        
        if searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex != 0 {
            print("1")          // 스코프 누른상태
            menuDatas.forEach{
                if $0.category == scope {       // scope에 해당하는 데이터들을 뿌려줌
                    filteredMenuDatas = $0.menu
                }
            }
        } else if searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex == 0 {
            print("2")      // 모든데이터를 뿌려준 상황
            menuDatas.forEach{
                filteredMenuDatas += $0.menu
            }
        } else if !searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex == 0 {
            print("3")      // 모든 데이터에서 검색하고 있고 all을 누른상태에서 검색
            menuDatas.forEach {
                filteredMenuDatas += $0.menu.filter{
                    $0.name.contains(searchText)        // $0은 메뉴데이터
                }
            }
        } else {
            print("4")          // 스코프 누른상태에서 검색할때
            filteredMenuDatas = menuDatas.filter{$0.category == scope}.flatMap{
                $0.menu.filter{$0.name.contains(searchText)}}
        
        }
        
            tableView.reloadData()
        }
        
        func searchBarIsEmpty() -> Bool {
            return searchController.searchBar.text?.isEmpty ?? true
            
        }

}
// 검색했을때 들어옴
    
extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope)
    }
    
    
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // 스코프를 눌렀을때
        filterContentForSearchText(searchBar.text!, searchBar.scopeButtonTitles![selectedScope])
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // cancel 버튼 눌렀을때
        let searchBar = searchController.searchBar
        searchBar.selectedScopeButtonIndex = 0
    }
}

