//
//  ViewController.swift
//  TestCombineSwift
//
//  Created by Bizplay on 2023/07/24.
//


import UIKit
import Combine


class ViewController: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var tableView : UITableView!
    
    //MARK: - Properties
    // Create an instance of the user Manager
    private let userViewModel = UserViewModel()
    
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Fetch user data
        self.fetchUser()
    }
    
    //MARK: - Function
 
    private func fetchUser() {
        // Create a user subscriber to receive user updates
        self.userViewModel.$users.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        .store(in: &cancellables)
        
        self.userViewModel.fetchUserData()

    }
    /**
     In the scenario where you have the `cancellables` set created in multiple places (e.g., in the DataAccess class, ViewModel, and ViewController),
     you should call the deinit method in the class that is responsible for managing the lifetime of the subscriptions.
     Typically, this would be the class that owns the cancellables set.
    */
    deinit {
        cancellables.forEach {$0.cancel()}
    }


}

//MARK: - Table view data source
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        let user = self.userViewModel.users[indexPath.row]
        
        cell.textLabel?.text = user.name
        
        return cell
    }
}

