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
    - The  `UserManager` class manages the user data and has a `userPublisher` property of type `PassthroughSubject<[User], Error>` as the publisher for user updates.
 */
class UserViewModel {
   
    let userPublisher = PassthroughSubject<[User], Error>()
   
    private var cancellables = Set<AnyCancellable>()
    
    // Define a publisher for user updates
    @Published private(set) var users : [User]  = []
    
  
    func fetchUserData() {
        // Step 1: Create the URL to fetch user data from the API
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            // If the URL is invalid, send a failure completion to the userPublisher with an error
            self.userPublisher.send(completion: .failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        // Step 2: Use the DataAccess shared instance to fetch data from the URL
        DataAccess.shared.fetchData(from: url, with: userPublisher)
        
        // Step 3: Subscribe to the userPublisher to handle the fetched data and completion
        userPublisher.sink { completion in
            // Step 4: Handle the completion event, which indicates the data fetching status
            if case .failure(let error) = completion {
                // If the completion is a failure, print the error message
                print("User fetching failed with error: \(error)")
            }
        } receiveValue: { users in
            // Step 5: Handle the received user data
            // Assign the fetched users to the local 'users' property of the current instance
            self.users = users
        }
        .store(in: &cancellables) // Step 6: Store the cancellable returned by 'sink' in the 'cancellables' set to manage its lifetime
    }

    
    
}
