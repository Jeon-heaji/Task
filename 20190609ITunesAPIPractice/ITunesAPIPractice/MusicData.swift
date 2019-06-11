//
//  MusicData.swift
//  ITunesAPIPractice
//
//  Created by Jeon-heaji on 08/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation

struct Music: Codable {
    let results: [MusicData]
}

struct MusicData: Codable {
    let artistName: String?
    let trackName: String?
    let artworkUrl100: String
}
