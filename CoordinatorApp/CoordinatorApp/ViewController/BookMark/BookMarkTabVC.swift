//
//  BookMarkTapCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class BookMarkTabVC : UIViewController, StoryBoarded {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var myTableView : UITableView!
    
    //MARK: - Properties
    private var questionsViewModel = QuestionViewModel()
  
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
         super.viewDidLoad()
        self.questionsViewModel.initReadingData()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }

}
//MARK: - Extension TableView
extension BookMarkTabVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsViewModel.TOPIKQuestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookMarkTabTableViewCell
        let questionNumber = self.questionsViewModel.TOPIKQuestionArray[indexPath.row]
        
         // Get the corresponding ReadingQuestion enum case
        if let question = QuestionType(rawValue: questionNumber.rawValue) {
            // Use the title in the cell
            cell.title.text = question.titleReading
        } else {
            cell.title.text = "Invalid Question"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ReadingQuestionVC") as? ReadingQuestionVC else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.indexTopic        = self.questionsViewModel.TOPIKQuestionArray[indexPath.row].rawValue
        self.present(vc, animated: true)
    }

}
