//
//  ResultVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import UIKit

class ResultVC: UIViewController, StoryBoarded {

    @IBOutlet weak var points       : UILabel!
    @IBOutlet weak var questions    : UILabel!
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.points.text    = "\(data[0])"
        self.questions.text      = "\(data[1])"
        
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
