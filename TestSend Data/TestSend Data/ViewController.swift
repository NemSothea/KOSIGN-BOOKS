//
//  ViewController.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/9/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
//    private var usersViewModel = UserViewModel()
//    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        configureUserViewToSendDataByInitializer()
//         
//         timer = .scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak usersViewModel] _ in
//             usersViewModel?.generateUser()
//         })
        
        configureFlagGame()
        
    }
    private func configureFlagGame() {
        let flagGame = UIHostingController(rootView: FlagGuessingGame())
        addChild(flagGame)
        flagGame.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flagGame.view)
        flagGame.didMove(toParent: self)
        NSLayoutConstraint.activate([
            flagGame.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagGame.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            flagGame.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            flagGame.view.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    
    
//    private func configureUserViewToSendDataByInitializer() {
//        let userViewController = UIHostingController(rootView: UserView(userViewModel: usersViewModel))
//        addChild(userViewController)
//        userViewController.view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(userViewController.view)
//        userViewController.didMove(toParent: self)
//        
//        NSLayoutConstraint.activate([
//            userViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            userViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            userViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
//    }

}

