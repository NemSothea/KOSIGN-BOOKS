//
//  ResultTableViewCell.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 12/30/23.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sectionLabel     : UILabel!
    @IBOutlet weak var questionLabel    : UILabel!

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
        self.questionLabel.text     = data.question
        self.option1.text           = data.option_1
        self.option2.text           = data.option_2
        self.option3.text           = data.option_3
        self.option4.text           = data.option_4
        self.option5.text           = "\(data.correctAnswer ?? "") ✅(정답)"
        
        self.option5.textColor      = UIColor.red
    
    }

    
}
