//
//  ContactDetailCell.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/23.
//

import UIKit

class ContactDetailCell: UITableViewCell {
    
    /*
        MARK :- @IBOutlet
     */
    @IBOutlet weak var profileDetailImg   : UIImageView!
    @IBOutlet weak var contactDetailName  : UILabel!
    @IBOutlet weak var neckDetailName     : UILabel!
    @IBOutlet weak var contactDetailPhone : UILabel!
    
    @IBOutlet weak var stackView          : UIStackView!
    @IBOutlet weak var callBtn            : UIButton!
    @IBOutlet weak var updateBtn          : UIButton!
    @IBOutlet weak var deleteBtn          : UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
