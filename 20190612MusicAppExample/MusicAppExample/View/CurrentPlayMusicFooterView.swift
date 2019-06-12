//
//  CurrentPlayMusicFooterView.swift
//  URLSessionPractice
//
//  Created by Wi on 11/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class CurrentPlayMusicFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    
    // MARK: - data properties
    
    var isPlaying = false {
        didSet {
            self.isPlayingLabel.isHidden = isPlaying
            self.trackNameLabel.isHidden = !isPlaying
            self.artistNameLabel.isHidden = !isPlaying
            self.playButton.isSelected = isPlaying
        }
    }
    
    var track: Track? {
        didSet {
            guard let track = self.track else { return }
            self.albumImageView.loadImage(with: track.artworkUrl100)   //이미지를 비동기적으로 받아옴
            self.trackNameLabel.text = track.trackName
            self.artistNameLabel.text = track.artistName
        }
    }
    
    var delegate: CurrentPlayMusicFooterViewDelegate?
 
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        imageView.image = #imageLiteral(resourceName: "defualtMusicImage")
        return imageView
    }()
    
    let trackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading.."
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading.."
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    let isPlayingLabel: UILabel = {
        let label = UILabel()
        label.text = "재생 중이 아님"
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "pause"), for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonEventHandler(_:)), for: .touchUpInside)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "next"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor.lightGray        // 바꾼 컬러로 됨
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(albumImageView)
        albumImageView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 10 , paddingRight: 0, width: 50, height: 50)
        
        addSubview(isPlayingLabel)
        isPlayingLabel.anchor(top: nil, left: albumImageView.trailingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        isPlayingLabel.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor).isActive = true
        
        addSubview(nextButton)
        nextButton.anchor(top: nil, left: nil, bottom: nil, right: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 30, height: 25)
        nextButton.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor).isActive = true
        
        addSubview(playButton)
        playButton.anchor(top: nil, left: nil, bottom: nil, right: nextButton.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 45, width: 30, height: 35)
        playButton.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor).isActive = true
        
        addSubview(trackNameLabel)
        trackNameLabel.anchor(top: nil, left: albumImageView.trailingAnchor, bottom: nil, right: playButton.leadingAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        trackNameLabel.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor,constant: -10).isActive = true
        trackNameLabel.isHidden = true
        
        addSubview(artistNameLabel)
        artistNameLabel.anchor(top: trackNameLabel.bottomAnchor, left: albumImageView.trailingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        artistNameLabel.isHidden = true
      
    }
    @objc private func buttonEventHandler(_ sender: UIButton) {
//        print("play button tap")
        sender.zoomIn()
        delegate?.playPauseButtonDidTap(footerView: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
