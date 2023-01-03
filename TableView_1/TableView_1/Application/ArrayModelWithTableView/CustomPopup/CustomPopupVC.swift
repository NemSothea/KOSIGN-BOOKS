//
//  CustomPopupVC.swift
//  TableView_1
//
//  Created by Bizplay on 2023/01/02.
//

import UIKit

class CustomPopupVC: UIViewController {

    /*
     @IBOutlet
     */
    @IBOutlet weak var imgLogo              : UIView!
    @IBOutlet weak var txtFieldUserName     : UITextField!
    @IBOutlet weak var txtFieldPhoneNumber  : UITextField!
    

    /*
            MARK :- ViewController - LifeCycle
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.viewWithTag(101)?.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(didTap(sender:))))
        
        
    }
    /*
        MARK :-  @IBAction
     */
    @IBAction func didTapAdd(_ sender : UIButton) {
        
    }
    
    /*
        MARK :-  @Objc
     */
    @objc func didTap(sender : UIGestureRecognizer) {
        self.dismiss(animated: true)
    }

}
