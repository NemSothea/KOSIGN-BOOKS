//
//  ListeningQuestionVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/21.
//

import UIKit

class ListeningQuestionVC: UIViewController {
    
    
   // MARK: - @IBOutlet
    
    @IBOutlet weak var topicTitle       : UILabel!
    @IBOutlet weak var playButton       : UIButton!
    @IBOutlet weak var collectionView   : UICollectionView!
    @IBOutlet weak var nextButton       : UIButton!
    @IBOutlet weak var backButton       : UIButton!
    
    //MARK: - Variable
    
    private var listeningViewModel         = ListeningViewModel()
    
    private var answerSelected   = false
    private var isCorrectAnswer  = false
    
    private var wrongAnswerArray : [ReadingQuestionModel.Question] = []
    
    private var index            = 0
    var indexTopic               = 0
   
    private var  isPlay64        = true
    
    let fontSize = Share.shared.setFontSize()
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setUI()
        
        self.playButton.isEnabled = self.indexTopic != 27
        
        self.listeningViewModel.getData(for: self.indexTopic)
        
        self.topicTitle.text = QuestionType(rawValue: self.indexTopic)?.titleListening
        
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
    }
    // MARK: - @IBAction
    @IBAction func playTap(_ sender: UIButton) {
        DispatchQueue.main.async {
            if self.indexTopic == 64 {
                self.listeningViewModel.original64Play(index: "64")
               
                if self.isPlay64 {
                    self.playButton.setImage(UIImage(systemName: "pause.fill"), for:.normal)
                    self.isPlay64 = false
                }else {
                    self.playButton.setImage(UIImage(systemName: "play.fill"), for:.normal)
                    self.isPlay64 = true
                }
            }else {
                self.listeningViewModel.playOrPause()
                if self.listeningViewModel.isPlaying {
                    self.playButton.setImage(UIImage(systemName: "pause.fill"), for:.normal)
                }else {
                    self.playButton.setImage(UIImage(systemName: "play.fill"), for:.normal)
                }
            }
        }
    }
    
    @IBAction func exitTap(_ sender : UIButton) {
        
        let alert = UIAlertController(title: "  내용\n  ", message: "     확신 합니까?     \n", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: " 취소 ", style: .cancel) { (_) in
           return
        }
        
    
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedTitle")
        
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedMessage")
        
        
        let okAction = UIAlertAction(title: " 넵 ", style: .default) { (_) in
            self.listeningViewModel.stopPlay(index: "\(self.indexTopic)")
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
            let alert = UIAlertController(title: "알림\n", message: "     선택해주기 바랍니다. \n", preferredStyle: .alert)
            
            alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedTitle")
            
            alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!,NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedMessage")
            
            let okAction = UIAlertAction(title: "확인", style: .destructive)
            alert.addAction(okAction)
            present(alert, animated: true,completion: nil)
            return
        }
        
        self.answerSelected = false
        /** TODO -:
         - When selected question correctly add score
         */
        if !self.isCorrectAnswer {
            /** TODO -:
             - When selected question wrong show popup details
             */
            if self.listeningViewModel.data?.questions?[index].detail == nil {
                return
            }
            guard let popUpVC = storyboard?.instantiateViewController(withIdentifier: "PopupVC") as? PopupVC else { return }
            if self.listeningViewModel.data?.questions?[index].detail == nil {
                popUpVC.detail0 = "조심하게 선택해주십시오."
            }else {
                popUpVC.detail0 = self.listeningViewModel.data?.questions?[index].question ?? ""
                popUpVC.detail1 = self.listeningViewModel.data?.questions?[index].detail ?? ""
            }
            
            guard let objs = self.listeningViewModel.data?.questions?[index] else {
                return
            }
            
            self.wrongAnswerArray.append(objs)
         
            self.present(popUpVC, animated: true)
            return
        }
        /** TODO -:
         - When click next move to other questions
         */
        if self.index < (self.listeningViewModel.data?.questions?.count ?? 0) - 1 {
            self.index += 1
          
            self.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }else {
            /** TODO -:
             - Show final result with score, Number of question, Wrong selected
             */
            guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
            resultVC.data          = ["\(resultTopik().0)","\(resultTopik().1)","\(resultTopik().2)"]
            self.listeningViewModel.stopAllCurrentPlay()
            resultVC.modalPresentationStyle = .fullScreen
            self.present(resultVC, animated: true)
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
        let questionsObj    = self.listeningViewModel.data?.questions?.count ?? 0
        let wrongQuestions  = self.wrongAnswerArray.removingDuplicates().count
        let correctAnswer   = questionsObj - wrongQuestions
        // Percentage
        let percentage = Float(wrongQuestions) /  Float(questionsObj)
        let finalPercentage = percentage * 100
        
       
        let formattedPercentage = String(format: "%.0f%%", finalPercentage)
        return(String(correctAnswer),String(questionsObj),formattedPercentage)
        
    }
}

  //MARK: - Extension CollectionView

extension ListeningQuestionVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listeningViewModel.data?.questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ReadingQuestionCollectionViewCell else {
            return ReadingQuestionCollectionViewCell()
        }
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        cell.setValues = self.listeningViewModel.data?.questions?[indexPath.row]
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
