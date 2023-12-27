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
    @IBOutlet weak var niceLabel            : UILabel!
    @IBOutlet weak var scoreLabel           : UILabel!
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
        self.congratulationLabel.font   = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.niceLabel.font             = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        self.scoreLabel.font            = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        self.questions.text             = "You have reached \(data[0]) of \(data[1]) questions(s), \(data[2])"
    }
    @IBAction func backHomeTap(_ sender: Any) {
        
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
