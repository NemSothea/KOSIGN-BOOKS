//
//  ResultTableViewCell.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 12/30/23.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sectionLabel     : UILabel!
    @IBOutlet weak var questionLabel    : UITextView!

    @IBOutlet weak var option1          : UILabel!
    @IBOutlet weak var option2          : UILabel!
    @IBOutlet weak var option3          : UILabel!
    @IBOutlet weak var option4          : UILabel!
    @IBOutlet weak var option5          : UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(data : ReadingQuestionModel.Question) {
        
        let fontSize = Share.shared.setFontSize()
        
        self.sectionLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.questionLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option1.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option2.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option3.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option4.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option5.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        self.sectionLabel.text      = data.sections
        self.sectionLabel.textColor = .black
        
        let attributedSectionLabel = NSMutableAttributedString(string: "\(data.question ?? "")")

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        let isPad = UIDevice.current.userInterfaceIdiom == .pad
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing =  3 // Whatever line spacing you want in points
        
        paragraphStyle.lineHeightMultiple = isPad ? 2 : 1.5

        // *** Apply attribute to string ***
        attributedSectionLabel.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedSectionLabel.length))
//        self.questionLabel.numberOfLines    = 0
        self.questionLabel.textColor  = .black
        self.questionLabel.attributedText   = attributedSectionLabel
        

        self.option1.text           = data.option_1
        self.option2.text           = data.option_2
        self.option3.text           = data.option_3
        self.option4.text           = data.option_4
        self.option5.text           = "\(data.correctAnswer ?? "") ✅(정답)"
        self.option1.textColor      = .black
        self.option2.textColor      = .black
        self.option3.textColor      = .black
        self.option4.textColor      = .black
        self.option5.textColor      = UIColor.red
    
    }

    
}
