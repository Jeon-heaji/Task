//
//  Data.swift
//  KaKaoAPITranslatedTest
//
//  Created by Jeon-heaji on 30/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation

// MARK: - Translator
struct Translator: Codable {
    let translatedText: [[String]]
    
    enum CodingKeys: String, CodingKey {
        case translatedText = "translated_text"
    }
}
