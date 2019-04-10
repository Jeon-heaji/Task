//
//  ViewController.swift
//  20190402_과제2
//
//  Created by Jeon-heaji on 02/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    // 동물별 count
    var dogCount = 0
    var catCount = 0
    var birdCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    // 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 넘어서면 화면이 전환되지 않도록 막기
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "dog":
            if dogCount >= 8 {
                return false
            } else {
                return true
            }
        case "cat":
            if catCount >= 10 {
                return false
            } else {
                return true
            }
        case "bird":
            if birdCount >= 15 {
                return false
            } else {
                return true
            }
        default:
            return false
        }
        
    }
    
    
    // 각 동물별 버튼을 눌렀을때  segue.identifire를 확인후 count 1씩 증가, 각 image추가
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        switch segue.identifier {
        case "dog":
            dogCount += 1
            if let temp = segue.destination as? SecondViewController {
                temp.animal = "Image1"
            }
        case "cat":
            catCount += 1
            if let temp = segue.destination as? SecondViewController{
                temp.animal = "Image2"
            }
            
        case "bird":
            birdCount += 1
            if let temp = segue.destination as? SecondViewController{
                temp.animal = "Image3"
            }
        default:
            break
        }
        
    }
    // 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가
    // unwind됐을때 SecondViewController -> ViewController
    // unwind의 name은 어디서 오는지 그 view의 이름을 따라서 짓기..

    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let sVC = unwindSegue.source as? SecondViewController else { return }
        dogCount += sVC.count
        catCount += sVC.count
        birdCount += sVC.count
        print(dogCount, catCount, birdCount)
    }
    
}

