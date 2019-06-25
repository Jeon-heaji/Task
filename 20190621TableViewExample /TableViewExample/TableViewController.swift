//
//  TableViewController.swift
//  TableViewExample
//
//  Created by Jeon-heaji on 20/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecipe))
        
        recipes.append(Recipe(recipeImage: nil, recipeDiscription: "some"))
        
        // register
        tableView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
    }
    
    // MARK: - Handler
    
    @objc private func addRecipe(){
        recipes.append(Recipe(recipeImage: nil, recipeDiscription: "추가"))
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonCell
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Step\(section + 1)"
    }

}
extension TableViewController: ButtonCellDelegate {
    func buttonDidTap(cell: ButtonCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        if recipes.count == 1 {return}
        recipes.remove(at: indexPath.section)
        tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
        tableView.reloadData()
    }
}

//
//import UIKit
//// 재료 추가에는 이미지 없음
//protocol TestCellTableDelegate: UICollectionViewCell {
//    func removeIdx(cell:TestCellTable )
//    func sendText(cell: TestCellTable, Text: String)
//}
//
//class TestCellTable: UITableViewCell {
//
//    var delegate: TestCellTableDelegate?
//    var MeterialTableCell = ""
//
//    @IBOutlet weak var meterialsTextfield: UITextField!
//    @IBOutlet weak var amountTextfield: UITextField!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        meterialsTextfield.delegate = self
//        amountTextfield.delegate = self
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow(_:)),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil)
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide(_:)),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil)
//
//    }
//
//    // MARK: - keyboard hide
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.contentView.endEditing(true)
//    }
//
//    // MARK: - Notification
//    // 키보드 보이기 액션
//    @objc func keyboardWillShow(_ sender: Notification) {
//        guard let userInfo = sender.userInfo,
//            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as?
//            CGRect else { return }
//
//        print(keyboardFrame.height * 0.8)
//        self.superview?.superview?.superview?.frame.origin.y = -keyboardFrame.height * 0.8
//    }
//
//    // 키보드 숨기기
//    @objc func keyboardWillHide(_ sender: Notification) {
//
//        self.superview?.superview?.superview?.frame.origin.y = 0
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//
//    @IBAction func textfieldEditingChanged(_ sender: UITextField) {
//        delegate?.sendText(cell: self, Text: sender.text ?? "")
//    }
//
//    @IBAction func minusBtn(_ sender: UIButton) {
//        delegate?.removeIdx(cell: self)
//
//    }
//}
//extension TestCellTable: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//
//}
