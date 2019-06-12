//
//  SearchVC.swift
//  URLSessionPractice
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import AVKit

class SearchVC: UITableViewController {
    
    
    // MARK: - Properties
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    var track = [Track]()
    var player: AVPlayer?
    var searchWord: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search controller configure
        searchControllerConfigure()
        
        // Search data Configure
        getSearchData(searchTerm: "양다일")
        
        // cell register
        tableView.register(TrackCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CurrentPlayMusicFooterView.self, forHeaderFooterViewReuseIdentifier: "PlayingView")
        
        // tableView separatorInset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
        tableView.separatorColor = .gray
        // 왼쪽에서 90만큼 떨어진곳부터 시작
    }
    
    // MARK: - Configuration
    
    private func searchControllerConfigure() {
        
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.placeholder = "Search Music"
        searchController.obscuresBackgroundDuringPresentation = true
        

    }
    // MARK: - tabelView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return track.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackCell
        cell.track = self.track[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: track[indexPath.row].previewUrl) else { return }
        let avPlayerController = AVPlayerViewController()
        
        guard let footerView = tableView.footerView(forSection: 0) as? CurrentPlayMusicFooterView else { return }
        
        footerView.track = track[indexPath.row]
        footerView.isPlaying = true
        player = AVPlayer(url: url)         // AVPlayer 내부적으로 만들게 됨
        
//        avPlayerController.player = player
//        present(avPlayerController, animated: true, completion: nil)    // 새로운창이뜨게됨
        player!.play()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PlayingView") as! CurrentPlayMusicFooterView
        footerView.delegate = self
        return footerView
        
    }
    
    
    // MARK: - Networking
    
    private func getSearchData(searchTerm: String) {
        
        let defaultSession = URLSession(configuration: .default)
        
        guard var urlComponent = URLComponents(string: "https://itunes.apple.com/search") else { return }
        urlComponent.query = "media=music&entity=song&term=\(searchTerm)"
        
        guard let url = urlComponent.url else { return }
        let dataTask = defaultSession.dataTask(
        with: url) { (data, response, error) in
            // error
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                do {
                    let result = try JSONDecoder().decode(Result.self, from: data)
                    self.track = result.results
                    print(self.track)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
         
        }
        dataTask.resume()
    }
}

extension SearchVC: CurrentPlayMusicFooterViewDelegate {
    func playPauseButtonDidTap(footerView: CurrentPlayMusicFooterView) {
        guard let player = self.player else { return }
        
        if footerView.isPlaying {       // 재생버튼 눌렀을때 재생이 되고 있으면
            player.pause()
        } else {
            player.play()
        }
        footerView.isPlaying.toggle()
    }
}

extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        if searchWord != nil {
            getSearchData(searchTerm: searchWord!)
        } else {
            getSearchData(searchTerm: searchBar.text!)
        }
        
        getSearchData(searchTerm: searchBar.text!)
        print("Updating SearchBar Text: ",searchBar.text!)
    }
}

extension SearchVC: UISearchControllerDelegate {
    func willDismissSearchController(_ searchController: UISearchController) {
        print("WillDismiss SearchBar Text: ", searchController.searchBar.text)
        searchWord = searchController.searchBar.text
    }
}

