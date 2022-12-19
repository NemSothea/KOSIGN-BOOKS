//
//  ViewController.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/16.
//

import UIKit

class MainMenuViewController: UIViewController {

    /*
        MAKR :- @IBOutlet
     */
    @IBOutlet weak var tableView : UITableView!
    
    
    /*
        MAKR :- Properties or Variable
     */
    
    let mainMenuVM = MainMenuViewModel()
    
    
    /*
            MARK :- ViewController - LifeCycle
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainMenuVM.intitValueCellData()
    }
    
    /*
        MARK :-  @IBaction
     */
    
    
    
    
    /*
        MARK :- Function
     */

}
/*
    MARK :- TableViewDelegate, Datasource
 */
extension MainMenuViewController : UITableViewDelegate, UITableViewDataSource {
    /*
        MAKR :- TableViewDataSource
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainMenuVM.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    /*
        MARK :- TableViewDelegate
     */
    
    
}

