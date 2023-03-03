//
//  BookMarkTabTableViewCell.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import UIKit

class BookMarkTabTableViewCell : UITableViewCell {

    @IBOutlet weak var title    : UILabel!
    @IBOutlet weak var icon     : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.icon.tintColor = UIColor.random()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
