//
//  MenuTableViewCell.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/19.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    /*
        MARK :- @IBOutlet
     */
    @IBOutlet weak var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
