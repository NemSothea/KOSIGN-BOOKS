//
//  TableViewCell.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var decriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
