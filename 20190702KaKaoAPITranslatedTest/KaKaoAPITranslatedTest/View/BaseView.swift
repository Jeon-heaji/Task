//
//  BaseView.swift
//  KaKaoAPITranslatedTest
//
//  Created by Jeon-heaji on 30/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    var isChange = false
    
    
    @IBOutlet weak var koButton: UIButton!
    @IBOutlet weak var enButton: UIButton!
    @IBOutlet weak var koTextView: UITextView!
    @IBOutlet weak var enTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()

        koTextView.layer.borderWidth = 0.3
        koTextView.layer.borderColor = UIColor.black.cgColor
        
        enTextView.layer.borderWidth = 0.3
        enTextView.layer.borderColor = UIColor.black.cgColor
   
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    @IBAction func kobuttonDidtap(_ sender: UIButton) {
        koButton.tag = 1
    }
    @IBAction func enbuttonDidtap(_ sender: UIButton) {
        enButton.tag = 2
    }
    @IBAction func changBtnDidTap(_ sender: UIButton) {
        
        if isChange == false {
            koButton.titleLabel?.text = "영어"
            enButton.titleLabel?.text = "한국어"
            isChange = true
        } else {
            enButton.titleLabel?.text = "한국어"
            koButton.titleLabel?.text = "영어"
            isChange = false
        }
    }
    
    @IBAction func removeBtnDidTap(_ sender: UIButton) {
        koTextView.text = ""
        enTextView.text = ""
    }
    
    @IBAction func translateBtnDidTap(_ sender: UIButton) {
        guard let text = koTextView.text else { return print("error") }
        Network.shared.kakaoAPI(Text: text) { (str) in
            DispatchQueue.main.async {
                self.enTextView.text = str
            }
        }
    }
}
