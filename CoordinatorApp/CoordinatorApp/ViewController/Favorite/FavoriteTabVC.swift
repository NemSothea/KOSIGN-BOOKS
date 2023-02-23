//
//  FavoriteVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class FavoriteTabVC : UIViewController, StoryBoarded {
    
    @IBOutlet weak var myTableView : UITableView!
    
    private var listenginVM = ListeningViewModel()
  
    
    override func viewDidLoad() {
         super.viewDidLoad()
        self.listenginVM.initListeningData()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }

}

extension FavoriteTabVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listenginVM.TOPIKQuestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookMarkTabTableViewCell
        cell.title.text = self.listenginVM.TOPIKQuestionArray[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ListeningQuestionVC") as? ListeningQuestionVC else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.headerTitle  = self.listenginVM.TOPIKQuestionArray[indexPath.row]
        vc.indexTopik        = indexPath.row
        self.navigationController?.present(vc, animated: true)
    }
    
    
}
