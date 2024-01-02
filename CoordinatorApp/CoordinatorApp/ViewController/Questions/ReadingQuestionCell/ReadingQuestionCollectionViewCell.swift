//
//  ReadingQuestionCollectionViewCell.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/14.
//

import UIKit
enum SelectionOption {
    case optionA
    case optionB
    case optionC
    case optionD
}

class ReadingQuestionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sectionLabel     : UILabel!
    @IBOutlet weak var questionLabel    : UILabel!
    @IBOutlet weak var questionImg      : UIImageView!
    
    @IBOutlet weak var option1          : UILabel!
    @IBOutlet weak var option2          : UILabel!
    @IBOutlet weak var option3          : UILabel!
    @IBOutlet weak var option4          : UILabel!
    
    @IBOutlet weak var optionA          : UIControl!
    @IBOutlet weak var optionB          : UIControl!
    @IBOutlet weak var optionC          : UIControl!
    @IBOutlet weak var optionD          : UIControl!
    @IBOutlet weak var imgHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackImage       : UIStackView!
    @IBOutlet weak var emptyStack       : UIStackView!
    
    private var correctionAnswer        : String?
    var selectedOption                  : ((_ selectedAnswer : Bool) -> Void)?
    
    var setValues : ReadingQuestionModel.Question? {
        didSet {
            //Set up font style
            self.setUpFont()
            
            let attributedSectionLabel = NSMutableAttributedString(string: setValues?.sections ?? "")

            // *** Create instance of `NSMutableParagraphStyle`
            let paragraphStyle = NSMutableParagraphStyle()

            // *** set LineSpacing property in points ***
            paragraphStyle.lineSpacing = 1 // Whatever line spacing you want in points

            // *** Apply attribute to string ***
            attributedSectionLabel.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedSectionLabel.length))
                                          
            self.sectionLabel.attributedText  = attributedSectionLabel
            
            if self.setValues?.isImg == "y" {
                self.questionLabel.text     = nil
                self.stackImage.isHidden    = false
                self.emptyStack.isHidden    = true
                self.questionLabel.isHidden = true
                self.questionImg.isHidden   = false
                self.imgHeightConstraint.constant = UIScreen.main.bounds.height / 2
                
                self.questionImg.frame = CGRectMake(0.0, 0.0,UIScreen.main.bounds.width, (UIScreen.main.bounds.height / 2) - 20)
                
                self.questionImg.image = UIImage(named:setValues?.question ?? "")
            }else {
                stackImage.isHidden             = true
                self.questionImg.isHidden       = true
                emptyStack.isHidden             = false
                self.questionImg.image          = nil
                self.questionLabel.isHidden     = false
                self.imgHeightConstraint.constant = 0.0
                
                let attributedString = NSMutableAttributedString(string: setValues?.question ?? "")

                // *** Create instance of `NSMutableParagraphStyle`
                let paragraphStyle = NSMutableParagraphStyle()

                // *** set LineSpacing property in points ***
                paragraphStyle.lineSpacing = 1 // Whatever line spacing you want in points

                // *** Apply attribute to string ***
                attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

                // *** Set Attributed String to your label ***
 
                self.questionLabel.attributedText         = attributedString
            }
            
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
    private func setUpFont() {
        
        let fontSize = Share.shared.setFontSize()
        
        self.sectionLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.questionLabel.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
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
