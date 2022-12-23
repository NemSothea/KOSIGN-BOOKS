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
        
        let menuData = mainMenuVM.cells[indexPath.row].value as! MenuInfo
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "Menucell") as! MenuTableViewCell
        menuCell.titleLabel.text = menuData.title

        return menuCell
    }
    
    /*
        MARK :- TableViewDelegate
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuDataType = mainMenuVM.cells[indexPath.row].value as! MenuInfo
        
        switch menuDataType.rowType {
            
        case .ArrayModelWithTableView :
            
            let vc = storyBoard(withStoryBoardName: "ContactSB", identifier: "ContactViewController") as! ContactViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case .AddDeleteUpdateRow:
            break
        case .LoadDataAnimation:
            break
        case .CollectionInSideTableView:
            break
        case .TableViewWithSection:
            break
        case .HeaderAndFooter:
            break
        case .ReusableXibFile:
            break
        case .Pagination:
            break
        case .TableViewCell:
            break
        }
        
    }
    
    
}

