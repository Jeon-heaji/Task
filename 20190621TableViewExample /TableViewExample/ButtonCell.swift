//
//  ButtonCell.swift
//  TableViewExample
//
//  Created by Jeon-heaji on 20/06/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import UIKit
protocol ButtonCellDelegate: class {
    func buttonDidTap(cell: ButtonCell)
}
class ButtonCell: UITableViewCell {
    weak var delegate: ButtonCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonDidTap(_ sender: Any) {
        delegate?.buttonDidTap(cell: self)
    }
    
}
