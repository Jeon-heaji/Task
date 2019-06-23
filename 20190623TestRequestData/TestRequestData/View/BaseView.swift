//
//  BaseView.swift
//  TestRequestData
//
//  Created by Jeon-heaji on 23/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
import AVFoundation

class BaseView: UIView {
    
    var player: AVAudioPlayer!

    @IBOutlet weak var textView: UITextView!
    
    
    @IBAction func runBtn(_ sender: UIButton) {
        NetWork.shared.kakaoAPI(textView.text!) {
            self.player = try? AVAudioPlayer(data: $0)
            self.player.play()
        }
        print("Run")
    }
}
