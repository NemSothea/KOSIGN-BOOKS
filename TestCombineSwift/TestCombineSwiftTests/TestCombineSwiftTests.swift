//
//  TestCombineSwiftTests.swift
//  TestCombineSwiftTests
//
//  Created by Bizplay on 2023/07/26.
//

import XCTest
import Combine

final class TestCombineSwiftTests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()
       
    func testFetchData() {
        let expectation = self.expectation(description: "Data fetched successfully")
        
        let mockURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        // Create the DataViewModel and the PassthroughSubject
        let publisher = PassthroughSubject<[User], Error>()
        // Subscribe to the PassthroughSubject to capture emitted data
        publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Failed with error: \(error)")
            }
        }, receiveValue: { users in
            XCTAssertEqual(users.count, 10)
            XCTAssertEqual(users.last?.name ?? "", "Clementina DuBuque")
        }).store(in: &cancellables)
        
        // Call fetchData and publisher
        DataAccess.shared.fetchData(from: mockURL, with: publisher)
        
        // Wait for the expectation to fulfill (timeout of 5 seconds)
        waitForExpectations(timeout: 5, handler: nil)
    }
  

}
