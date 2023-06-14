//
//  LoginViewController.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/06/08.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    
    private lazy var loginVM                = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupBinding()
    }
    
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
        let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerID") as! ViewController
        DispatchQueue.main.async {
            homeVc.modalPresentationStyle = .fullScreen
            self.present(homeVc, animated: true)
        }
    }
    
    @IBAction func SignupButtonPress(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Please enter email and password..")
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
