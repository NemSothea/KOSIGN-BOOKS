

import UIKit

class TopUpCell: UICollectionViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var arrowImage   : UIImageView!
    @IBOutlet weak var bankImg      : UIImageView!
    @IBOutlet weak var topUpLabel   : UILabel!
    @IBOutlet weak var topUpButton  : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .blue
        
    }
    
    //MARK: - Function
    func configCell() {
        
        self.topUpLabel.text    = "Top-Up your Balance with"
        self.bankImg.image      = UIImage(named: "bakong_logo")
        self.arrowImage.image   = UIImage(named: "arrow_right")
        self.topUpButton.setTitle("", for: .normal)
        
    }

}
