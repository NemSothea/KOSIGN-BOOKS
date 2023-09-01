
import UIKit

class QuickBuyCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var proImg   : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: - Function
    func configCell(viewData: Wrapper){
        proImg.image = UIImage(named: viewData.img ?? "")
    }
}
