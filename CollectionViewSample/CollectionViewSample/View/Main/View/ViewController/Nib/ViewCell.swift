

import UIKit

class ViewCell: UICollectionViewCell {
    
    @IBOutlet weak var superView    : UIView!
    @IBOutlet weak var titleHeader  : UILabel!
    @IBOutlet weak var headerIcon   : UIImageView!
    @IBOutlet weak var conView      : UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        superView.backgroundColor = UIColor(named: "forestColor")
    }
    
    func configCell(viewData: Wrapper){
        self.conView.backgroundColor = .white
        self.headerIcon.image        = UIImage(named: viewData.img ?? "")
        self.titleHeader.text        = viewData.title
        
    }
    
}
