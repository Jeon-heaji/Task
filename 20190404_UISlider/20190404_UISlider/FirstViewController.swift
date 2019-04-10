//
//  ViewController.swift
//  20190404_UISlider
//
//  Created by Jeon-heaji on 04/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //slider
    var redSlider = UISlider()
    var greenSlider = UISlider()
    var blueSlider = UISlider()
    //Label
    var redLabel = UILabel()
    var greenLabel = UILabel()
    var blueLabel = UILabel()
    // button
    var actionButton = UIButton(type: .system)
    //singleton 변수생성
    var singletonB = SingletonClass.shared
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfiguration()
       
    }
    
    func viewConfiguration () {
        
        //redSlider
        redSlider.frame = CGRect(x: 30, y: 140, width: view.frame.width - 60, height: 30)
        redSlider.addTarget(self, action: #selector(sliderFunc(_:)), for: .valueChanged)
        view.addSubview(redSlider)
        
        // greenSlider
        greenSlider.frame = CGRect(x: 30, y: 240, width: view.frame.width - 60, height: 30)
        greenSlider.addTarget(self, action: #selector(sliderFunc(_:)), for: .valueChanged)
        view.addSubview(greenSlider)
        
        // blueSlider
        blueSlider.frame = CGRect(x: 30, y: 350, width: view.frame.width - 60, height: 30)
        blueSlider.addTarget(self, action: #selector(sliderFunc(_:)), for: .valueChanged)
        view.addSubview(blueSlider)
        
        //redLabel
        redLabel.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 30)
        redLabel.backgroundColor = .red
        redLabel.text = "red"
        redLabel.textColor = .white
        view.addSubview(redLabel)
        
        //greenLabel
        greenLabel.frame = CGRect(x: 30, y: 200, width: view.frame.width - 60, height: 30)
        greenLabel.textColor = .white
        greenLabel.text = "green"
        greenLabel.backgroundColor = .green
        view.addSubview(greenLabel)
        
        //blueLabel
        blueLabel.frame = CGRect(x: 30, y: 310, width: view.frame.width - 60, height: 30)
        blueLabel.textColor = .white
        blueLabel.text = "blue"
        blueLabel.backgroundColor = .blue
        view.addSubview(blueLabel)
        
        //button
        actionButton.frame = CGRect(x: view.center.x - 100, y: 450, width: 200, height: 70)
        actionButton.backgroundColor = .lightGray
        actionButton.addTarget(self, action: #selector(buttonFunc(_:)), for: .touchUpInside)
        actionButton.setTitle("Button", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        view.addSubview(actionButton)
        
//       print(redSlider.maximumValue)
        
    }
    
    @objc func sliderFunc(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            singletonB.redSlider1 = redSlider.value
            
        case greenSlider:
            singletonB.greenSlider1 = greenSlider.value
        case blueSlider:
            singletonB.blueSlider1 = blueSlider.value
        default:
            break
            
        }

    }
    @objc func buttonFunc(_ senbder: UIButton) {
        
        let sVC = SecondViewController()
        present(sVC, animated: true)
        
    }

}
