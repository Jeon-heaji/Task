//
//  ViewController.swift
//  20190329Test_review
//
//  Created by Jeon-heaji on 31/03/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 토탈머니 소지금
    var myMoney = 70000     // 소지금
//    var tempMoney = 0       // temp변수
    var totalMoney = 0      // 결제금액
    // 가격
    let jjajangPrice = 5000     // 짜장가격
    let jjamPrice = 6000        // 짬뽕가격
    let tangPrice = 12000      // 탕수육가격
    // 카운트
    var jjajangCount = 0        // 짜장수량
    var jjamCount = 0           // 짬뽕수량
    var tangCount = 0           // 탕수육수량
    

    //스토리보드
    //jjajang
    @IBOutlet weak var jjajangQuantityLabel: UILabel!
    @IBOutlet weak var jjajangOrderButton: UIButton!
    //jjam
    @IBOutlet weak var jjamQuantityLabel: UILabel!
    @IBOutlet weak var jjamOrderButton: UIButton!
    //tang
    @IBOutlet weak var tangQuantityLabel: UILabel!
    @IBOutlet weak var tangOrderButton: UIButton!
    
    // 코드
    // 소지금
    let myMoneyLabel = UILabel()
    var myMoneyCountLabel = UILabel()
    var resetButton = UIButton(type: .system)
    //결제금액
    let totalMoneyLabel = UILabel()
    var totalMoneyCountLabel = UILabel()
    var totalMoneyPaymentButton = UIButton(type: .system)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //짜장,짬뽕,탕수육 주문버튼에 대한 addtarget -> oredrFood
        jjajangOrderButton.addTarget(self, action: #selector(orderFood(_:)), for: .touchUpInside)
        jjamOrderButton.addTarget(self, action: #selector(orderFood(_:)), for: .touchUpInside)
        tangOrderButton.addTarget(self, action: #selector(orderFood(_:)), for: .touchUpInside)
        
        //소지금
        myMoneyLabel.frame = CGRect(x: 20, y: 350, width: 80, height: 40)
        myMoneyLabel.text = "소지금"
        myMoneyLabel.textColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        myMoneyLabel.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        myMoneyLabel.textAlignment = .center
        view.addSubview(myMoneyLabel)
        
        //70000원레이블
        myMoneyCountLabel.frame = CGRect(x: 110, y: 350, width: 140, height: 40)
        myMoneyCountLabel.text = "70000원"
        myMoneyCountLabel.textAlignment = .center
        myMoneyCountLabel.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        myMoneyCountLabel.textColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        view.addSubview(myMoneyCountLabel)
        
        //초기화버튼
        resetButton.frame = CGRect(x: 270, y: 350, width: 80, height: 40)
        resetButton.setTitle("초기화", for: .normal)
        resetButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        resetButton.addTarget(self, action: #selector(resetAction(_:)), for: .touchUpInside)
        resetButton.setTitleColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), for: .normal)
        view.addSubview(resetButton)
        
        //결제금액
        totalMoneyLabel.frame = CGRect(x: 20, y: 400, width: 80, height: 40)
        totalMoneyLabel.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        totalMoneyLabel.textAlignment = .center
        totalMoneyLabel.text = "결제금액"
        totalMoneyLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(totalMoneyLabel)
        
        // 결제금액카운트 0원
        totalMoneyCountLabel.frame = CGRect(x: 110, y: 400, width: 140, height: 40)
        totalMoneyCountLabel.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        totalMoneyCountLabel.textAlignment = .center
        totalMoneyCountLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        totalMoneyCountLabel.text = "0원"
        view.addSubview(totalMoneyCountLabel)
        
        // 결제버튼
        totalMoneyPaymentButton.frame = CGRect(x: 270, y: 400, width: 80, height: 40)
        totalMoneyPaymentButton.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.8987853168), for: .normal)
        totalMoneyPaymentButton.setTitle("결제", for: .normal)
        totalMoneyPaymentButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        totalMoneyPaymentButton.addTarget(self, action: #selector(orderFood(_:)), for: .touchUpInside)
        view.addSubview(totalMoneyPaymentButton)
       
    }


    @objc func orderFood(_ sender:UIButton) {
        switch sender {
        case jjajangOrderButton:
            jjajangCount += 1
            jjajangQuantityLabel.text = "\(jjajangCount)"
            totalMoney += jjajangPrice
            totalMoneyCountLabel.text = "\(totalMoney)원"
        case jjamOrderButton:
            jjamCount += 1
            jjamQuantityLabel.text = "\(jjamCount)"
            totalMoney += jjamPrice
            totalMoneyCountLabel.text = "\(totalMoney)원"
        case tangOrderButton:
            tangCount += 1
            tangQuantityLabel.text = "\(tangCount)"
            totalMoney += tangPrice
            totalMoneyCountLabel.text = "\(totalMoney)원"
            
        case totalMoneyPaymentButton:
            paymentAlert(sum: totalMoney)
    
        default:
            break
        }
        
        
    }
    
    //reset all 전체 리셋
    @objc func resetAction(_ sender:UIButton) {

          resetAction2()
        
    }
    //결제창위한 AlertController , 취소버튼은 결제금액이 안넘었을때, 금액초과시 취소버튼 x -> else에 집어넣기
    func paymentAlert(sum: Int) {
        let paymentAlertController = UIAlertController(title: "결제창", message: "총 결제 금액은 \(sum)원 입니다.", preferredStyle: .alert)
        
        if sum > self.myMoney {
            let orderAction = UIAlertAction(title: "주문불가", style: .default)
            paymentAlertController.addAction(orderAction)
            resetAction3()
        } else {
            let orderAction1 = UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.myMoney = self.myMoney - self.totalMoney
                self.myMoneyCountLabel.text = "\(self.myMoney)원"
                self.resetAction3()

            })
            paymentAlertController.addAction(orderAction1)
            
            let cancelAciton = UIAlertAction(title: "취소", style: .cancel) { _ in
                self.resetAction3()
               
            }
            paymentAlertController.addAction(cancelAciton)
            
        }
  
        present(paymentAlertController, animated: true)
    }

    func resetAction2(){
        jjajangCount = 0
        jjajangQuantityLabel.text = "\(jjajangCount)"
        jjamCount = 0
        jjamQuantityLabel.text = "\(jjamCount)"
        tangCount = 0
        tangQuantityLabel.text = "\(tangCount)"
        totalMoney = 0
        totalMoneyCountLabel.text = "\(totalMoney)원"
        myMoney = 70000
        myMoneyCountLabel.text = "\(myMoney)원"
    }
    func resetAction3(){
        jjajangCount = 0
        jjajangQuantityLabel.text = "\(jjajangCount)"
        jjamCount = 0
        jjamQuantityLabel.text = "\(jjamCount)"
        tangCount = 0
        tangQuantityLabel.text = "\(tangCount)"
        totalMoney = 0
        totalMoneyCountLabel.text = "\(totalMoney)"
        
    }
}

