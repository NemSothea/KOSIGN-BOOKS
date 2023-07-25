//
//  DataAccess.swift
//  TestCombineSwift
//
//  Created by Bizplay on 2023/07/25.
//
import Foundation
import Combine

final class DataAccess {
    
    private static let sharedInstance   = DataAccess()
    private static var sessionConfig    : URLSessionConfiguration!
    private var cancellables            = Set<AnyCancellable>()
    
    private init() {}
    
    static var shared : DataAccess = {
        
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 40.0
        sessionConfig.timeoutIntervalForResource = 60.0
        
        return sharedInstance
    }()
    
    func fetchData<T: Decodable>(from url: URL, with publisher: PassthroughSubject<[T], Error>) {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [T].self, decoder: JSONDecoder())
            .sink { completion in
                if case .failure(let error) = completion {
                    publisher.send(completion: .failure(error))
                } else {
                    publisher.send(completion: .finished)
                }
            } receiveValue: { data in
                publisher.send(data)
            }
            .store(in: &cancellables)
    }
    
    
}
