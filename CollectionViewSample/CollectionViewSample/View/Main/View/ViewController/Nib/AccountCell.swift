

import UIKit

class AccountCell: UICollectionViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var totalHistory         : UILabel!
    @IBOutlet weak var amountLabel          : UILabel!
    @IBOutlet weak var imageHistory         : UIImageView!
    @IBOutlet weak var historyLabel         : UILabel!
    @IBOutlet weak var imageBalance         : UIImageView!
    @IBOutlet weak var balanceLabel         : UILabel!
    @IBOutlet weak var userID               : UILabel!
    @IBOutlet weak var userName             : UILabel!
    @IBOutlet weak var profileImage         : UIImageView!
    @IBOutlet weak var profileButton        : UIButton!
    @IBOutlet weak var balanceButton        : UIButton!
    @IBOutlet weak var historyButton        : UIButton!
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileButton.setTitle("", for: .normal)
        self.balanceButton.setTitle("", for: .normal)
        self.historyButton.setTitle("", for: .normal)
    }
    
    //MARK: - Function
    func configCell(accountData: AccountInfo) {
        
        self.profileImage.image     = UIImage(named: accountData.pfImg ?? "")
        self.userName.text          = accountData.userName
        self.userID.text            = accountData.userID
        self.amountLabel.text       = accountData.amount
        self.totalHistory.text      = accountData.numberHistory
        self.imageBalance.image     = UIImage(named: accountData.balanceArrow ?? "")
        self.imageHistory.image     = UIImage(named: accountData.historyArrow ?? "")
        self.balanceLabel.text      = "Balance"
        self.historyLabel.text      = "History"
        
    }
    
    //MARK: - @IBAction
    @IBAction func historyPress(_ sender: Any) {
    }
    
    @IBAction func balancePress(_ sender: Any) {

    }
    
    @IBAction func profilePress(_ sender: Any) {
    }
}
