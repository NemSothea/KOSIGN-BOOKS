//
//  ReadingQuestion.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import UIKit

class ReadingQuestionVC: UIViewController {
    
    /* MARK :-
        - @IBOutlet
     */
    @IBOutlet weak var topikTitle       : UILabel!
    @IBOutlet weak var collectionView   : UICollectionView!
    
    
    /* MARK :-
        - varaible
     */
    private var questionsVM         = QuestionViewModel()
    
    var answerSelected   = false
    var isCorrectAnswer  = false
    var correctAwswer    = 0
    var index            = 0
    var totalScore       = 0
    var headerTitle      = ""
    var indexTopik       = 0
    
    private var countWrongAws    = 0
    private var wrongResult      = Set<Int>()
    
    /* MARK :-
        - Lifecycle ViewController
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.topikTitle.text = headerTitle
        self.questionsVM.getData(index: self.indexTopik)
        
        DispatchQueue.main.async {
            self.collectionView.delegate    = self
            self.collectionView.dataSource  = self
            self.collectionView.reloadData()
        }
      
        
    }
    /* MARK :-
        - @IBAction
     */
    @IBAction func exitTap(_ sender : UIButton) {
        let alert = UIAlertController(title: "내용\n", message: "확신 합니까?\n", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "넵", style: .default) { (_) in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
           return
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true,completion: nil)
        
    }
    
    @IBAction func nextTap(_ sender : UIButton) {
        /*TESTING
        if index<(self.questionsVM.data?.questions?.count ?? 0) - 1 {
            index += 1
            self.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }
       */
        if !self.answerSelected {
            let alert = UIAlertController(title: "알림", message: "선택해주기 바랍니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true,completion: nil)
            return
        }
        self.answerSelected = false
        if self.isCorrectAnswer {
            self.correctAwswer += 1
            
            self.wrongResult.insert(countWrongAws)
        }else {
            guard let popUpVC = storyboard?.instantiateViewController(withIdentifier: "PopupVC") as? PopupVC else { return }
            if self.questionsVM.data?.questions?[index].detail == nil {
                popUpVC.detail = "조심하게 선택해주십시오."
            }else {
                popUpVC.detail = self.questionsVM.data?.questions?[index].detail ?? ""
            }
            self.countWrongAws += 1
            self.present(popUpVC, animated: true)
            return
        }
        if index<(self.questionsVM.data?.questions?.count ?? 0) - 1 {
            index += 1
            if self.isCorrectAnswer {
                self.totalScore += Int(self.questionsVM.data?.questions?[index].score ?? "") ?? 0
            }
           
            self.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }else {
            guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
            resultVC.data          = ["\(totalScore)","\(wrongResult.count)","\(self.questionsVM.data?.questions?.count ?? 0)"]
            resultVC.modalPresentationStyle = .fullScreen
            self.present(resultVC, animated: true)
        }
         
    }

}
/*
  MAKR :- Extension CollectionView
 */
extension ReadingQuestionVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsVM.data?.questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ReadingQuestionCollectionViewCell else {
            return ReadingQuestionCollectionViewCell()
        }
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        cell.setValues = questionsVM.data?.questions?[indexPath.row]
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
