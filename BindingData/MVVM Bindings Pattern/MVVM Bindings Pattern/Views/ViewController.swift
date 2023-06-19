//
//  ViewController.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/05/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var tableView : UITableView!
    
    private var userViewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.title = "Users"
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        /* Method : 1 -> How to call :
         
        NotificationCenter.default.addObserver(self, selector: #selector(self.postNotification(_:)), name: NSNotification.Name(rawValue: "NewPost"), object: nil)
         
        */
        self.userViewModel.users.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        self.userViewModel.fetchData()
        
        //TODO: CALL PUSH FUNCTION
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.registerForRemoteNotification()
        
    }
    @objc func postNotification(_ userInfo : Notification) {
        
        let obj = userInfo.object as! NSDictionary
        guard let aps = obj.object(forKey: "aps") as? [String :Any] else {return}
        guard let isNewPost = aps["post"] as? String else { return }
        
        if isNewPost == "true" {
            let postVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postViewControllerID") as! PostViewController
            self.navigationController?.pushViewController(postVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.users.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.userViewModel.users.value[indexPath.row].name
        return cell
    }
    @IBAction func postButtonPress(_ sender: UIButton) {
        self.pushPostVC()
    }
    func pushPostVC() {
        let postVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postViewControllerID") as! PostViewController
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    

}
