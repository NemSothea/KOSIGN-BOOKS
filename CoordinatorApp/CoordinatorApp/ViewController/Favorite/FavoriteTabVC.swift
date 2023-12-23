//
//  FavoriteVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class FavoriteTabVC : UIViewController, StoryBoarded {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var myTableView : UITableView!
    
    //MARK: - Properties
    private var listeningViewModel = ListeningViewModel()
  
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
         super.viewDidLoad()
        self.listeningViewModel.initListeningData()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }

}
//MARK: - UITableView
extension FavoriteTabVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listeningViewModel.TOPIKQuestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookMarkTabTableViewCell
        
        let questionNumber = self.listeningViewModel.TOPIKQuestionArray[indexPath.row]
        
        let fontSize = Share.shared.setFontSize()
        
        cell.title.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
        // Get the corresponding ReadingQuestion enum case
        if let question = QuestionType(rawValue: questionNumber.rawValue) {
            // Use the title in the cell
            cell.title.text = question.titleListening
        } else {
            cell.title.text = "Invalid Question"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ListeningQuestionVC") as? ListeningQuestionVC else { return }
        vc.modalPresentationStyle   = .fullScreen
        vc.indexTopic               = self.listeningViewModel.TOPIKQuestionArray[indexPath.row].rawValue
        self.navigationController?.present(vc, animated: true)
    }
}
