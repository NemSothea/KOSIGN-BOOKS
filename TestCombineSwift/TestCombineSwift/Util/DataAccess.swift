//
//  DataAccess.swift
//  TestCombineSwift
//
//  Created by Bizplay on 2023/07/25.
//
import Foundation
import Combine

final class DataAccess {
    // Step 1: Create a private shared instance (Singleton pattern) of the DataAccess class.
    // This ensures that there is only one instance of DataAccess throughout the app.
    private static let sharedInstance = DataAccess()
    
    // Step 2: Create a private session configuration property to customize the URLSession behavior.
    private static var sessionConfig: URLSessionConfiguration!
    
    // Step 3: Create a set of cancellables to manage the Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    // Step 4: Make the initializer private to prevent other instances of DataAccess from being created.
    private init() {}
    
    // Step 5: Create a static shared property that returns the shared instance of DataAccess.
    // This allows other parts of the app to access DataAccess using DataAccess.shared.
    static var shared: DataAccess = {
        // Step 6: Initialize the shared instance.
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 40.0
        sessionConfig.timeoutIntervalForResource = 60.0
        
        return sharedInstance
    }()
    
    // Step 7: Define a generic fetchData method to fetch data from a given URL and pass it through the provided publisher.
    func fetchData<T: Decodable>(from url: URL, with publisher: PassthroughSubject<[T], Error>) {
        // Step 8: Use URLSession.shared.dataTaskPublisher to create a data task publisher.
        URLSession.shared.dataTaskPublisher(for: url)
            // Step 9: Map the received data to the .data property of the DataTaskPublisher.Output.
            .map(\.data)
            // Step 10: Decode the received data to the specified generic type [T].
            .decode(type: [T].self, decoder: JSONDecoder())
            .sink { completion in
                // Step 11: Handle the completion event.
                if case .failure(let error) = completion {
                    // Step 12: If the completion is a failure, send the error through the publisher.
                    publisher.send(completion: .failure(error))
                } else {
                    // Step 13: If the completion is a success, send a completion signal through the publisher.
                    publisher.send(completion: .finished)
                }
            } receiveValue: { data in
                // Step 14: Handle the received data.
                // Send the data through the publisher.
                publisher.send(data)
            }
            // Step 15: Store the cancellable returned by sink in the cancellables set to manage its lifetime.
            .store(in: &cancellables)
    }
}

    

