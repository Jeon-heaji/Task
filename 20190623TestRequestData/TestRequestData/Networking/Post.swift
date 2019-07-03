//
//  Post.swift
//  TestRequestData
//
//  Created by Jeon-heaji on 23/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation

class NetWork {
    static let shared = NetWork()
    
    func kakaoAPI(_ text: String, completion: @escaping (Data) -> ()) {
        
        let url = URL(string: "https://kakaoi-newtone-openapi.kakao.com/v1/synthesize")!
        
        let headers = [
            "Authorization": "KakaoAK 51ee73d3f90160581db5903f59b35e88",
            "Content-Type": "application/xml"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        // request의 헤더에 여기서 만든 headers를 넣어준것.
        // request 준비
        
        let xmlFile = """
            <speak>
            <voice name="WOMAN_DIALOG_BRIGHT">\(text)</voice>
            </speak>
            """.data(using: .utf8)
        
        request.httpBody = xmlFile
        
        let task = URLSession.shared.dataTask(
        with: request) { (data, response, error) in
            print("Run Inside")
//            guard let res = response as? HTTPURLResponse else { return }
//            print(res)
            
            guard let data = data else { return }
//            print(data)             // mp3파일
            completion(data)

        }
        task.resume()
        
    }
    

}
