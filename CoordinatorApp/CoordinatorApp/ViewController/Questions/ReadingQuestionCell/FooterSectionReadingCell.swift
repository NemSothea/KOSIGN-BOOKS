//
//  FooterSectionReadingCell.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 1/21/24.
//

import UIKit



class FooterSectionReadingCell: UICollectionViewCell {
    
    @IBOutlet weak var option1          : UILabel!
    @IBOutlet weak var option2          : UILabel!
    @IBOutlet weak var option3          : UILabel!
    @IBOutlet weak var option4          : UILabel!
    
    @IBOutlet weak var optionA          : UIControl!
    @IBOutlet weak var optionB          : UIControl!
    @IBOutlet weak var optionC          : UIControl!
    @IBOutlet weak var optionD          : UIControl!

    private var correctionAnswer        : String?
    var selectedOption                  : ((_ selectedAnswer : Bool) -> Void)?
    
    var setValues : ReadingQuestionModel.Question? {
        didSet {
            //Set up font style
            self.setUpFont()
            
            self.option1.text       = setValues?.option_1
            self.option2.text       = setValues?.option_2
            self.option3.text       = setValues?.option_3
            self.option4.text       = setValues?.option_4
            self.correctionAnswer   = setValues?.correctAnswer
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        self.updateBorder(myView: optionA)
        self.updateBorder(myView: optionB)
        self.updateBorder(myView: optionC)
        self.updateBorder(myView: optionD)
    }
    @IBAction func onClickOptionA(_ sender : Any) {
        
        var isCorrect = false
        if correctionAnswer == setValues?.option_1 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionA)
    }
    @IBAction func onClickOptionB(_ sender : Any) {
        var isCorrect = false
        if correctionAnswer == setValues?.option_2 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionB)
    }
    @IBAction func onClickOptionC(_ sender : Any) {
        var isCorrect = false
        if correctionAnswer == setValues?.option_3 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionC)
    }
    @IBAction func onClickOptionD(_ sender : Any) {
        var isCorrect = false
        if correctionAnswer == setValues?.option_4 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionD)
    }
    
    /// Description : changeBorder
    /// - Parameter selectedOption: optionA will have white border round
    func changeBorder(selectedOption : SelectionOption) {
        switch selectedOption {
        case .optionA :
            self.updateBorder(myView: optionA,borderWidth: 1)
            self.updateBorder(myView: optionB)
            self.updateBorder(myView: optionC)
            self.updateBorder(myView: optionD)
        case .optionB :
            self.updateBorder(myView: optionB,borderWidth: 1)
            self.updateBorder(myView: optionA)
            self.updateBorder(myView: optionC)
            self.updateBorder(myView: optionD)
        case .optionC :
            self.updateBorder(myView: optionC,borderWidth: 1)
            self.updateBorder(myView: optionA)
            self.updateBorder(myView: optionB)
            self.updateBorder(myView: optionD)
        case .optionD :
            self.updateBorder(myView: optionD,borderWidth: 1)
            self.updateBorder(myView: optionA)
            self.updateBorder(myView: optionB)
            self.updateBorder(myView: optionC)
        }
    }
    /// Description : setUpFont
    private func setUpFont() {
        
        let fontSize = Share.shared.setFontSize()
        
        self.option1.font       = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option2.font       = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option3.font       = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.option4.font       = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
    }
    
    private func updateBorder(myView : UIView, borderWidth : CGFloat = 0) {
        myView.layer.borderWidth = borderWidth
        myView.layer.borderColor = UIColor.white.cgColor
    }

}
