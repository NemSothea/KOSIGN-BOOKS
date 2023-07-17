//
//  LoginViewController.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/06/08.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IBoutlet
    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    
    //MARK: - Properties
    private lazy var loginVM                = LoginViewModel()
    
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupBinding()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //MARK: - Function
    private func setupBinding() {
        self.loginVM.loginSuccess.bind { [weak self] success in
            
            if success {
                
                self?.setHome()
                
            }else {
                print("Login failed")
            }
        }
    }
    private func setHome() {
        guard let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerID") as? ViewController else {
            return
        }
        self.navigationController?.pushViewController(homeVc, animated: true)
    }
    
    //MARK: - @IBAction
    @IBAction func SignInPressed(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
          
            return
        }
     
     
        self.loginVM.requestLogin(email: email, password: password)
        
     
        
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
