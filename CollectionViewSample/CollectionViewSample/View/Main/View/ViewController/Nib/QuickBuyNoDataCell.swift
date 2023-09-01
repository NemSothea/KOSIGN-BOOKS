

import UIKit

class QuickBuyNoDataCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var noDataLabel  : UILabel!
    @IBOutlet weak var noDataView   : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.noDataLabel.text = "No Data"
    }
}
