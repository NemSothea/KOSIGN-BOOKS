

import UIKit

class MarkOrderCell: UICollectionViewCell {

    
    //MARK: - IBOutlet
    @IBOutlet weak var orderView    : UIView!
    @IBOutlet weak var orderLabel   : UILabel!
    @IBOutlet weak var orderImage   : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    //MARK: - Function
    func configCell(menuString: String, menuColor: String){
        
        switch menuString {
        case "Order":
            self.orderImage.image = UIImage(named: "order_icon")
            
        case "Tea Time":
            self.orderImage.image = UIImage(named: "tea_time")
            
        case "Transfer":
            self.orderImage.image = UIImage(named: "transfer_icon")
            
        default:
            self.orderImage.image = UIImage(named: "order_icon")
        }
        
        self.orderView.backgroundColor = UIColor.init(hexString: menuColor)
        self.orderLabel.text = menuString
        
    }
}
