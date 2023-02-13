//
//  BookMarkTapCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class BookMarkTapVC : UIViewController, StoryBoarded {
    
    weak var coordinator : BookmarkCoordinator?
    
    override func viewDidLoad() {
         super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
}

extension BookMarkTapVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
