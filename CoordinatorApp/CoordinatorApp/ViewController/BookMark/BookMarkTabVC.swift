//
//  BookMarkTapCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class BookMarkTabVC : UIViewController, StoryBoarded {
    @IBOutlet weak var myTableView: UITableView!
    
    weak var coordinator            : BookmarkCoordinator?
    
    private var TOPIKQuestionArray  = ["TOPIK II READING 24th"]
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
}

extension BookMarkTabVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TOPIKQuestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookMarkTabTableViewCell
        cell.title.text = TOPIKQuestionArray[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
