//
//  ReadingQuestion.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import UIKit

class ReadingQuestionVC: UIViewController {
    
    @IBOutlet weak var topikTitle   : UILabel!
    
    private var questionsVM         = QuestionViewModel()
    var quesitions                  : [QuestionViewModel]?
    
    var answerSelected   = false
    var isCorrectAnswer  = false
    var  points          = 0
    var index            = 0
    var headerTitle      = ""
    var indexTopik       = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.topikTitle.text = headerTitle
        
        self.questionsVM.getData(index: indexTopik)
        
    }
    @IBAction func exitTap(_ sender : UIButton) {
        
        self.dismiss(animated: true)
        
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
