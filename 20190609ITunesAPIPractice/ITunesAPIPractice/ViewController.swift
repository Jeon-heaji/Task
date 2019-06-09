//
//  ViewController.swift
//  ITunesAPIPractice
//
//  Created by Jeon-heaji on 08/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//


import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var urlString = "https://itunes.apple.com/search?media=music&entity=song&term=*"
    private var musicDataArr = [MusicData]()

    private let tabelView: UITableView = {
        let tabelView = UITableView()
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        return tabelView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabelView)
        tableViewSet()
        autoLayout()
        searchSetUp()
        fetchData()
        
    }
//    private let imageUrlString = "https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/06/b6/f4/06b6f4df-09e6-f341-d5b1-02f393b61ef3/source/30x30bb.jpg"
    
    fileprivate func fetchData() {
        
        let req = AF.request(urlString)
        req.validate()  // 200 -> OKcode(성공) , 400 -> 클라이언트에러, 500 -> 서버에러
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                    guard let musicList = try? JSONDecoder().decode(Music.self, from: value) else { return }
                    self.musicDataArr = musicList.results
                    // 비동기
                    DispatchQueue.main.async {
                        self.tabelView.reloadData()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
        }
    }
    
    private func searchSetUp() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.backgroundColor = .white
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchController.searchBar.placeholder = "Search!"
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func tableViewSet() {
        tabelView.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.identifire)
        tabelView.dataSource = self
        tabelView.rowHeight = 100
        
        let backgroundViewLabel = UILabel(frame: .zero)
        backgroundViewLabel.textColor = .darkGray
        backgroundViewLabel.numberOfLines = 0
        backgroundViewLabel.text =
        "song"
        tabelView.backgroundView = backgroundViewLabel
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tabelView.topAnchor.constraint(equalTo: guide.topAnchor),
            tabelView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tabelView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tabelView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
    }

    
}

// ui를 변경하는 작업을 하는애들 -> main.async, ex) tableVIew.reloadData()
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifire, for: indexPath) as! MusicTableViewCell
        cell.selectionStyle = .none
        let url = musicDataArr[indexPath.row].artworkUrl100
        let imageURL = URL(string: url)!
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    cell.titleImage.image = UIImage(data: data)
                }
            }

        }
        cell.titleLabel.text = musicDataArr[indexPath.row].trackName
        cell.subTitleLabel.text = musicDataArr[indexPath.row].artistName
        
        return cell
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
    }
    
}
extension ViewController: UISearchBarDelegate{
    // 검색을해서 텍스트를 넣고 리턴했을때 동작하는 델리게이트
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        urlString = "https://itunes.apple.com/search?media=music&entity=song&term=\(searchBar.text!)"
        fetchData()
    }
}
