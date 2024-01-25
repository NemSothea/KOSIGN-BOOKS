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
        self.animateTable()
    }
    private func animateTable() {
        self.myTableView.reloadData()
        
        let cells = myTableView.visibleCells
        let tableHeight: CGFloat = myTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
            }, completion: nil)
            index += 1
        }
    }

}
//MARK: - UITableView
extension FavoriteTabVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
            cell?.transform = CGAffineTransform.identity.scaledBy(x: 0.97, y: 0.97)
        }) { (_) in
              /// ************** do action here **************
        }
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut, animations: {
            cell?.transform = CGAffineTransform.identity.scaledBy(x: 1.01, y: 1.01)
        }) { (_) in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                cell?.transform = CGAffineTransform.identity
            }) { (_) in
                
                /// ************** do action here **************
            }
        }
    }
    
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
