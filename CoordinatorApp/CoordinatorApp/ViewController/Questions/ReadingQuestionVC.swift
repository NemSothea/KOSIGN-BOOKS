//
//  ReadingQuestion.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import UIKit
import SwiftUI

class ReadingQuestionVC: UIViewController {
    
   //MARK: - @IBOutlet
    @IBOutlet weak var topicTitle       : UILabel!
    @IBOutlet weak var nextButton       : UIButton!
    @IBOutlet weak var backButton       : UIButton!
    
    @IBOutlet weak var collectionView   : UICollectionView!
    
    
    
    //MARK: -Variable
    private var questionsVM         = QuestionViewModel()
    
    var answerSelected   = false
    var isCorrectAnswer  = false
    var correctAnswer    = 0
    var index            = 0

    var indexTopic       = 0
    
    private var wrongAnswerArray : [ReadingQuestionModel.Question] = []
    
    let fontSize = Share.shared.setFontSize()
    
   //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
        self.setUI()
        self.wrongAnswerArray.removeAll()
        self.questionsVM.getData(for: self.indexTopic)
        
        DispatchQueue.main.async {
            self.collectionView.delegate    = self
            self.collectionView.dataSource  = self
            self.collectionView.reloadData()
        }
    }
    // MARK: - Functions
    private func setUI() {
        
        let attritNextText = NSAttributedString(string: "다음", attributes: [NSAttributedString.Key.font: UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!])
        self.nextButton.setAttributedTitle(attritNextText, for: .normal)
        
        self.topicTitle.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
    
        let attritBackText = NSAttributedString(string: "떠나기", attributes: [NSAttributedString.Key.font: UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!])
        self.backButton.setAttributedTitle(attritBackText, for: .normal)
        
        self.topicTitle.text = QuestionType(rawValue: indexTopic)?.titleReading
        
        self.collectionView.register(UINib(nibName: "ReadingQuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    // MARK: - @IBAction
    @IBAction func exitTap(_ sender : UIButton) {
       
        sender.showAnimation {
            
            let alert = UIAlertController(title: " 내용\n ", message: "   확신 합니까?     \n", preferredStyle: .alert)
            
            alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: self.fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedTitle")
            
            alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: self.fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedMessage")
            
            let okAction = UIAlertAction(title: "넵", style: .default) { (_) in
                self.dismiss(animated: true)
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
                return
            }
            
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            
            
            self.present(alert, animated: false,completion: nil)
        }
    }
    
    @IBAction func nextTap(_ sender : UIButton) {
        
        #warning("test resultVC")
//        guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
//        resultVC.wrongAnswerArray = self.questionsVM.data?.questions ?? []
//        resultVC.result          = ["\(resultTopik().0)","\(resultTopik().1)","\(resultTopik().2)"]
//        self.present(resultVC, animated: true)
        
#warning("test popUpVC")
//        guard let popUpVC = storyboard?.instantiateViewController(withIdentifier: "PopupVC") as? PopupVC else { return }
//        self.present(popUpVC, animated: true)
        
        sender.showAnimation {
            
            if !self.answerSelected {
                let alert = UIAlertController(title: "알림\n", message: "선택해주기 바랍니다.\n", preferredStyle: .alert)
                
                alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: self.fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedTitle")
                
                alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: self.fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedMessage")
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true,completion: nil)
                return
            }
            self.answerSelected = false
            
            self.nextActionTap()
        }
        
        
    }
    /// When click Wrong Answer show alert message
    private func nextActionTap() {
      
        
        if !self.isCorrectAnswer {
            guard let popUpVC = storyboard?.instantiateViewController(withIdentifier: "PopupVC") as? PopupVC else { return }
            
            let question = self.questionsVM.data?.questions?[self.index].question ?? ""
            
            if self.questionsVM.data?.questions?[self.index].detail == nil {
                popUpVC.detail0 = "조심하게 선택해주십시오. \n \(question)"
            }else {
                let detail = self.questionsVM.data?.questions?[index].detail ?? ""
                
                popUpVC.detail0 = "\(question)\(detail)"
            }
            
            guard let objs = self.questionsVM.data?.questions?[index] else {
                return
            }
            
            self.wrongAnswerArray.append(objs)
           
            if let sheet = popUpVC.sheetPresentationController {
             
                sheet.detents = [.large()]
               
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 32
            }
            self.present(popUpVC, animated: true)
            return
         
        }
        if index < (self.questionsVM.data?.questions?.count ?? 0) - 1  {
            index += 1
           
            self.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }else {
//            guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
//            resultVC.result          = ["\(resultTopik().0)","\(resultTopik().1)","\(resultTopik().2)"]
//            resultVC.wrongAnswerArray = wrongAnswerArray.removingDuplicates()
//            
//            resultVC.modalPresentationStyle = .fullScreen
//            self.present(resultVC, animated: true)
            
            let resultView = UIHostingController(rootView: ResultView(result: ["\(resultTopik().0)","\(resultTopik().1)","\(resultTopik().2)"], wrongAnswerArray: wrongAnswerArray.removingDuplicates()))
            
            self.present(resultView, animated: true)
        }
    }
    func resultTopik() -> (String,String,String) {
        /*
        let totalQuestion       = 100
        let wrongAnswer         = 90
        let correctAnswer       = totalQuestion - wrongAnswer // (100 - 90)

        let findPercentage = Float(wrongAnswer) / Float(totalQuestion) // 10 / 100 = 0.1
        let finalPercentage = findPercentage * 100 // 10

        let formattedPercentage = String(format: "%.0f%%", finalPercentage)
        print(formattedPercentage)//10%
        */
        
        //Correct Answer + Wrong Answer
        let questionsObj    = self.questionsVM.data?.questions?.count ?? 0
        let wrongQuestions  = self.wrongAnswerArray.removingDuplicates().count
        let correctAnswer   = questionsObj - wrongQuestions
        // Percentage
        let percentage = Float(wrongQuestions) /  Float(questionsObj)
        let finalPercentage = 100 - (percentage * 100)
        
       
        let formattedPercentage = String(format: "%.0f%%", finalPercentage)
        return(String(correctAnswer),String(questionsObj),formattedPercentage)
    }
}

//MARK: - Extension CollectionView
extension ReadingQuestionVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.questionsVM.data?.questions?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ReadingQuestionCollectionViewCell else {
            return ReadingQuestionCollectionViewCell()
        }
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        cell.setValues = self.questionsVM.data?.questions?[indexPath.row]

        
        cell.selectedOption = { [weak self] isCorrect in
            self?.answerSelected    = true
            self?.isCorrectAnswer   = isCorrect
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
