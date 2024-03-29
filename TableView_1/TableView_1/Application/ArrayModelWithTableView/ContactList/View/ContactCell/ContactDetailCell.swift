//
//  ContactDetailCell.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/23.
//

import UIKit
import AnyFormatKit

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
        self.profileDetailImg.layer.masksToBounds = false
        self.profileDetailImg.layer.cornerRadius  = self.profileDetailImg.frame.height / 2
        self.profileDetailImg.clipsToBounds       = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func contactDetailConfigurCell(data : ContactInfo, isShow : Bool) {
        
        self.profileDetailImg.image     = UIImage(named: data.profile_img)
        self.contactDetailName.text     = data.contact_name
        self.neckDetailName.text        = data.neck_name
        self.contactDetailPhone.text    = DefaultTextInputFormatter(textPattern:"(###) - ### - ####").format(data.phone_number)
        self.callBtn.isHidden           = isShow
        self.updateBtn.isHidden         = isShow
        self.deleteBtn.isHidden         = isShow
        
    }

}
