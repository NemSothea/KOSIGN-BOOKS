//
//  BookMarkTapCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class BookMarkTabVC : UIViewController, StoryBoarded {
    
    @IBOutlet weak var myTableView : UITableView!
    
    private var questionsVM = QuestionViewModel()
  
    
    override func viewDidLoad() {
         super.viewDidLoad()
        self.questionsVM.initReadingData()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }

}

extension BookMarkTabVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsVM.TOPIKQuestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookMarkTabTableViewCell
        cell.title.text = self.questionsVM.TOPIKQuestionArray[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ReadingQuestionVC") as? ReadingQuestionVC else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.headerTitle  = self.questionsVM.TOPIKQuestionArray[indexPath.row]
        vc.indexTopik        = indexPath.row
        self.navigationController?.present(vc, animated: true)
    }
    
    
}
