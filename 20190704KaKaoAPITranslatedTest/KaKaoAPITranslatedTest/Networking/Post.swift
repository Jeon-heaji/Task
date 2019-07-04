//
//  Post.swift
//  KaKaoAPITranslatedTest
//
//  Created by Jeon-heaji on 30/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    func kakaoAPI(Text: String, src: Lang, target: Lang, completion: @escaping (String) -> ()) {
        
        let headers = [
            "Authorization": "KakaoAK 02df6a4dc873106d9713c899079c89c0"
        ]
        let text = Text.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let request = NSMutableURLRequest(url: NSURL(string: "https://kapi.kakao.com/v1/translation/translate?query=\(text)&src_lang=\(src)&target_lang=\(target)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                guard let data = data else { return }
                do {
                    let translator = try JSONDecoder().decode(Translator.self, from: data)
                    completion(translator.translatedText[0][0])
                } catch {
                    print(error.localizedDescription)
                }
                
                print(String(data: data, encoding: .utf8)!)
            }
        })
        dataTask.resume()
    }
    
}
