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
            
            self.sectionLabel.text  = setValues?.sections
            self.questionLabel.text = setValues?.question
            self.option1.text       = setValues?.option_1
            self.option2.text       = setValues?.option_2
            self.option3.text       = setValues?.option_3
            self.option4.text       = setValues?.option_4
            correctionAnswer        = setValues?.correctAnswer
            
        }
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
            updateBorder(myView: optionA,borderWidth: 4)
            updateBorder(myView: optionB)
            updateBorder(myView: optionC)
            updateBorder(myView: optionD)
        case .optionB :
            updateBorder(myView: optionB,borderWidth: 4)
            updateBorder(myView: optionA)
            updateBorder(myView: optionC)
            updateBorder(myView: optionD)
        case .optionC :
            updateBorder(myView: optionC,borderWidth: 4)
            updateBorder(myView: optionA)
            updateBorder(myView: optionB)
            updateBorder(myView: optionD)
        case .optionD :
            updateBorder(myView: optionD,borderWidth: 4)
            updateBorder(myView: optionA)
            updateBorder(myView: optionB)
            updateBorder(myView: optionC)
        }
    }
    
    
    func updateBorder(myView : UIView, borderWidth : CGFloat = 0) {
        myView.layer.borderWidth = borderWidth
        myView.layer.borderColor = UIColor.random().cgColor
    }
    
    
    
}
