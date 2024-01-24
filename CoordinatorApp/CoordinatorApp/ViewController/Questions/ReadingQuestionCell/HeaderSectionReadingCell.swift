//
//  SectionHeaderReadingCell.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 1/21/24.
//

import UIKit

class HeaderSectionReadingCell: UICollectionViewCell {

    @IBOutlet weak var sectionLabel     : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateConfiguration(data: String) {
        
        let attributedSectionLabel = NSMutableAttributedString(string: data)

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 1 // Whatever line spacing you want in points

        // *** Apply attribute to string ***
        attributedSectionLabel.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedSectionLabel.length))
        
        let fontSize = Share.shared.setFontSize()
        
        self.sectionLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        self.sectionLabel.attributedText  = attributedSectionLabel
        
    
    }

 

}
