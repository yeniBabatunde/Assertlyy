//
//  NetworkingTests.swift
//  AssertlyTests
//
//  Created by Sharon Omoyeni Babatunde on 06/01/2024.
//


import XCTest
@testable import Assertly

class NetworkingTests: BaseTestCase<NetworkingTests>, UnitTestable {
    
    var networking: MockNetworking!
    
    required init(dependencies: MockNetworking) {
        super.init()
        self.networking = dependencies
    }
    
    override func setUp() {
        super.setUp()
        // Additional setup if needed
    }
    
    override func tearDown() {
        // Additional teardown if needed
        super.tearDown()
    }
    
    override func createDependencies() -> MockNetworking {
        return MockNetworking()
    }
    
    func testSuccessfulRequest() {
        let expectation = self.expectation(description: "Successful request")
        let mockData = ["key": "value"]
        networking.mockResult = .success(mockData)
        
        networking.request("testEndpoint") { (result: Result<[String: String], Error>) in
            switch result {
            case .success(let data):
                XCTAssertEqual(data, mockData)
            case .failure:
                XCTFail("Expected success, got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
