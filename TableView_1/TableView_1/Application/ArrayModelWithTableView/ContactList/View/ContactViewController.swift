//
//  ContactViewController.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/20.
//

import UIKit

class ContactViewController: UIViewController {
    
    /*
        MARK :- @IBOutlet
     */
    @IBOutlet weak var addItem      : UIBarButtonItem!
    @IBOutlet weak var tableView    : UITableView!
    
    
    /*
        MARK :- Variable
     */
    private var contactVM   = ContactViewModel()
    var isShow : Bool       = true
    

    /*
        MARK :- ViewController LifeCyle
     */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.contactVM.initContactCellData()
        self.tableView.estimatedRowHeight   = 80
        self.tableView.rowHeight            = UITableView.automaticDimension
        self.addItem.isHidden               = isShow
        
    }
    
    /*
        MARK :- IBAction
     */
    @IBAction func addNewContact(_ sender : Any) {
        
        if let addContactVC = storyBoard(withStoryBoardName: "CustomPopupVC", identifier: "CustomPopupVC") as? CustomPopupVC {
            self.present(addContactVC, animated: true)
        }
        
    }
    
    /*
        MARK :- Function
     */
    
    
    /*
        MARK :- Objc
     */
    @objc private func deleleContact(_ sender : Any) {
        
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
/*
    MARK :- Extension
           
 */
    
extension ContactViewController : UITableViewDataSource {
    /*
        - UITableViewDataSource -> numberOfRowsInSection
        - UITableViewDataSource -> cellForRowAt
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactVM.contactCells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactData =  self.contactVM.contactCells[indexPath.row].value as! ContactInfo
        switch contactData.rowType {

        case .Profile :
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)  as! ContactCell
            profileCell.profileConfigure(data: contactData)

            return profileCell
      
        default :
            let contactDetailCell = tableView.dequeueReusableCell(withIdentifier: "ContactDetailCell", for: indexPath) as! ContactDetailCell
            contactDetailCell.contactDetailConfigurCell(data: contactData, isShow: isShow)
            return contactDetailCell
        }
        
    }
}
