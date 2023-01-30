//
//  ContactCell.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/23.
//

import UIKit
import AnyFormatKit

class ContactCell: UITableViewCell {
    /*
        MARK :- @IBOutlet
     */
    @IBOutlet weak var profileImg   : UIImageView!
    @IBOutlet weak var contactName  : UILabel!
    @IBOutlet weak var neckName     : UILabel!
    @IBOutlet weak var contactPhone : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImg.layer.borderWidth   = 0.5
        self.profileImg.layer.masksToBounds = false
        self.profileImg.layer.cornerRadius  = self.profileImg.frame.height / 2
        self.profileImg.clipsToBounds       = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func profileConfigure(data : ContactInfo) {
        
        self.profileImg.image   = UIImage(named: data.profile_img)
        self.contactName.text   = data.contact_name
        self.neckName.text      = data.neck_name
        self.contactPhone.text  =  DefaultTextInputFormatter(textPattern: "(###) - ### - ####").format(data.phone_number)
        
    }

}
