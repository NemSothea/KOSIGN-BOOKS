//
//  ListeningQuestionVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/21.
//

import UIKit

class ListeningQuestionVC: UIViewController {
    
    
    /* MARK :-
        - @IBOutlet
     */
    @IBOutlet weak var topikTitle       : UILabel!
    @IBOutlet weak var playBtn          : UIButton!
    
    @IBOutlet weak var collectionView   : UICollectionView!
    
    
    /* MARK :-
        - varaible
     */
    private var listeningVM         = ListeningViewModel()
    
    private var answerSelected   = false
    private var isCorrectAnswer  = false
    private var correctAwswer    = 0
    private var index            = 0
    private var totalScore       = 0
    var headerTitle              = ""
    var indexTopik               = 0
    private var countWrongAws    = 0
    private var wrongResult      = Set<Int>()
    
    /* MARK :-
        - Lifecycle ViewController
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.topikTitle.text = self.headerTitle
        
        self.playBtn.isEnabled = (self.indexTopik != 3 || self.indexTopik != 18)
        
        self.listeningVM.getData(index: self.indexTopik)
        
        DispatchQueue.main.async {
            self.collectionView.delegate    = self
            self.collectionView.dataSource  = self
            self.collectionView.reloadData()
        }
    }
    /* MARK :-
        - @IBAction
     */
    
    @IBAction func playTap(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.listeningVM.playOrPause()
            if self.listeningVM.isPlaying {
                self.playBtn.setImage(UIImage(systemName: "pause.fill"), for:.normal)
            }else {
                self.playBtn.setImage(UIImage(systemName: "play.fill"), for:.normal)
            }
            
        }
    }
    
    @IBAction func exitTap(_ sender : UIButton) {
        
        let alert = UIAlertController(title: "내용\n", message: "확신 합니까?\n", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
           return
        }
        let okAction = UIAlertAction(title: "넵", style: .default) { (_) in
            self.listeningVM.stopPlay()
            self.dismiss(animated: true)
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
        /** TODO -:
         - When question not selected popup appear
         */
        if !self.answerSelected {
            let alert = UIAlertController(title: "알림", message: "선택해주기 바랍니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true,completion: nil)
            return
        }
        
        self.answerSelected = false
        /** TODO -:
         - When selected question correctly add score
         */
        if self.isCorrectAnswer {
            self.correctAwswer += 1
            self.totalScore += Int(self.listeningVM.data?.questions?[index].score ?? "") ?? 0
        }else {
            /** TODO -:
             - When selected question wrong show popup details
             */
            if self.listeningVM.data?.questions?[index].detail == nil {
                return
            }
            guard let popUpVC = storyboard?.instantiateViewController(withIdentifier: "PopupVC") as? PopupVC else { return }
            if self.listeningVM.data?.questions?[index].detail == nil {
                popUpVC.detail = "정조심하게 선택해주세요."
            }else {
                popUpVC.detail = self.listeningVM.data?.questions?[index].detail ?? ""
            }
            self.present(popUpVC, animated: true)
            self.countWrongAws += 1
            return
        }
        /** TODO -:
         - When click next move to other questions
         */
        if self.index < (self.listeningVM.data?.questions?.count ?? 0) - 1 {
            self.index += 1
            self.wrongResult.insert(self.countWrongAws)
            self.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }else {
            /** TODO -:
             - Show final result with score, Number of question, Wrong selected
             */
            guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
            resultVC.data          = ["\(self.totalScore)","\(self.wrongResult.count)","\(self.listeningVM.data?.questions?.count ?? 0)"]
            resultVC.modalPresentationStyle = .fullScreen
            self.present(resultVC, animated: true)
        }
         
    }

}
/*
  MAKR :- Extension CollectionView
 */
extension ListeningQuestionVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listeningVM.data?.questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ReadingQuestionCollectionViewCell else {
            return ReadingQuestionCollectionViewCell()
        }
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        cell.setValues = self.listeningVM.data?.questions?[indexPath.row]
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
