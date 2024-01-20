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
    
    @IBOutlet weak var collectionView       : UICollectionView!
    
    //MARK: - Properties
    var result                              = [String]()
    var wrongAnswerArray : [ReadingQuestionModel.Question] = []
    
    //MARK: - ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setupUI()
        
    }
    private func setupUI() {
        
        let fontSize                    = Share.shared.setFontSize()
        self.questions.font             = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.congratulationLabel.font   =  UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.impressLabel.font          = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.scoreLabel.font            = UIFont(name: "BareunBatangOTF 1Light", size: fontSize)
        self.reCheckLabel.font            = UIFont(name: "BareunBatangOTF 1Light", size: fontSize)
        
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
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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

extension UIView {
    
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
