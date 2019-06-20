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
