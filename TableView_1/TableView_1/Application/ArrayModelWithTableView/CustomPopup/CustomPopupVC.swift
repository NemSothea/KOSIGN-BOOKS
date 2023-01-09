//
//  CustomPopupVC.swift
//  TableView_1
//
//  Created by Bizplay on 2023/01/02.
//

import UIKit
import IQKeyboardManagerSwift

class CustomPopupVC: UIViewController {

    /*
     @IBOutlet
     */
    @IBOutlet weak var mainView             : UIView!
    @IBOutlet weak var imgLogo              : UIImageView!
    @IBOutlet weak var txtFieldUserName     : UITextField!
    @IBOutlet weak var txtFieldPhoneNumber  : UITextField!
    

    /*
            MARK :- ViewController - LifeCycle
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configIQKeyboard : do {
            IQKeyboardManager.shared.enable = true
            IQKeyboardManager.shared.shouldResignOnTouchOutside = true
            IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
        }
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        self.mainView.addGestureRecognizer(tap)
        self.view.addSubview(self.mainView)
        
    }
  
    /*
        MARK :-  @IBAction
     */
    @IBAction func didTapAdd(_ sender : UIButton) {
        print("Did me")
    }
    
    /*
        MARK :-  @Objc
     */
    @objc func didTap(_ sender : UIPanGestureRecognizer? = nil) {
        print("Did Gesture")
        self.dismiss(animated: true)
    }

}
