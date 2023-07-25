//
//  UserViewModel.swift
//  TestCombineSwift
//
//  Created by Bizplay on 2023/07/24.
//

import Foundation
import Combine

/**
 - Create a class to manage the user data
    2. The  `UserManager` class manages the user data and has a `userPublisher` property of type `PassthroughSubject<[User], Error>` as the publisher for user updates.
 */
class UserViewModel {
   
    let userPublisher = PassthroughSubject<[User], Error>()
   
    private var cancellables = Set<AnyCancellable>()
    
    // Define a publisher for user updates
    @Published private(set) var users : [User]  = []
    
  
    func fetchUserData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            self.userPublisher.send(completion: .failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        DataAccess.shared.fetchData(from: url, with: userPublisher)
        
        userPublisher.sink { completion in
            if case .failure(let error) = completion {
                print("User fetching failed with error: \(error)")
            }
        } receiveValue: { users in
            self.users = users
        }
        .store(in: &cancellables)
        
    }
    
    
}
