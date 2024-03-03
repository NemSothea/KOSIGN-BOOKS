//
//  ResultVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import UIKit

class ResultVC: UIViewController, StoryBoarded, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlet
    @IBOutlet weak var questions            : UILabel!
    @IBOutlet weak var congratulationLabel  : UILabel!
    @IBOutlet weak var scoreLabel           : UILabel!
    @IBOutlet weak var impressLabel         : UILabel!
    
    @IBOutlet weak var reCheckLabel         : UILabel!
    @IBOutlet weak var homeButton           : UIButton!
    
    @IBOutlet weak var collectionView       : UICollectionView!
    
    //MARK: - Properties
    var result                              = [String]()
    var wrongAnswerArray : [ReadingQuestionModel.Question] = []
    
    //MARK: - ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setupUI()
        
        self.animateTable()
        
    }
    private func animateTable() {
        self.collectionView.reloadData()
        
        let cells = collectionView.visibleCells
        let tableHeight: CGFloat = collectionView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
            }, completion: nil)
            index += 1
        }
    }
    private func setupUI() {
        
        let fontSize                    = Share.shared.setFontSize()
        self.questions.font             = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.congratulationLabel.font   =  UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.impressLabel.font          = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.scoreLabel.font            = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        self.reCheckLabel.font          = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        let attritNextText = NSAttributedString(string: "재테스트", attributes: [NSAttributedString.Key.font: UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!])
        
        self.homeButton.setAttributedTitle(attritNextText, for: .normal)
        
        
        self.collectionView.register(UINib(nibName: "ResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "resultCollectionViewCell")
        self.questions.text             = " \n  You have reached \(result[0]) of \(result[1]) questions(s), \(result[2])   \n"
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wrongAnswerArray.count == 0 ? 0 : wrongAnswerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCollectionViewCell", for: indexPath) as? ResultCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(data: wrongAnswerArray[indexPath.row])
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
    @IBAction func backHomeTap(_ sender: UIButton) {
        sender.showAnimation {
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

