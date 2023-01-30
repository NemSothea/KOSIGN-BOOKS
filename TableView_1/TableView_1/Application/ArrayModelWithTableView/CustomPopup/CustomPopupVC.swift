//
//  CustomPopupVC.swift
//  TableView_1
//
//  Created by Bizplay on 2023/01/02.
//

import UIKit
import IQKeyboardManagerSwift

typealias CompletionpopUpInput = (String,String,String) -> Void

class CustomPopupVC: UIViewController {

    /*
     @IBOutlet
     */
    @IBOutlet weak var mainView             : UIView!
    @IBOutlet weak var imgLogo              : UIImageView!
    @IBOutlet weak var txtFieldNickName     : UITextField!
    @IBOutlet weak var txtFieldUserName     : UITextField!
    @IBOutlet weak var txtFieldPhoneNumber  : UITextField!
    
    /*
        MARK : - Variables
     */
    
    var saveCompletion : CompletionpopUpInput = { _,_,_ in }

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
        MARK :-  Function
     */
    private func alertInputInfo() {
        
        let alert = UIAlertController(title : "InCorrect Input",message: "Please check your \(checkInput())..", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
        
    }
    private func checkInput() -> String {
        var input = "Input"
        let nickName = txtFieldNickName.text ?? "", userName = txtFieldUserName.text ?? "", phoneNumber = txtFieldPhoneNumber.text ?? ""
        if nickName.isEmpty {
            input = "nick name"
        }else if userName.isEmpty {
            input = "User name"
        }else if phoneNumber.isEmpty {
            input = "Phone number"
        }
        return input
    }
  
    /*
        MARK :-  @IBAction
     */
    @IBAction func didTapAdd(_ sender : UIButton) {
        print("Did me")
        let nickName = txtFieldNickName.text ?? "", userName = txtFieldUserName.text ?? "", phoneNumber = txtFieldPhoneNumber.text ?? ""
        if !nickName.isEmpty && !userName.isEmpty && !phoneNumber.isEmpty {
            self.saveCompletion(nickName, userName, phoneNumber)
            self.dismiss(animated: true)
        }else {
            self.alertInputInfo()
        }
    }
   
    /*
        MARK :-  @Objc
     */
    @objc func didTap(_ sender : UIPanGestureRecognizer? = nil) {
        print("Did Gesture")
        self.dismiss(animated: true)
    }

}
