//
//  ResultVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import UIKit

class ResultVC: UIViewController, StoryBoarded {
    
    //MARK: - Outlet
    @IBOutlet weak var questions            : UILabel!
    @IBOutlet weak var congratulationLabel  : UILabel!
    @IBOutlet weak var scoreLabel           : UILabel!
    @IBOutlet weak var impressLabel         : UILabel!
    //MARK: - Properties
    var data                                 = [String]()
    
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
        
        self.questions.text             = " \n  You have reached \(data[0]) of \(data[1]) questions(s), \(data[2])   \n"
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
