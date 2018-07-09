//
//  GameTests.swift
//  GameTests
//
//  Created by Rodrigo Vianna on 09/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import XCTest
@testable import TesteDrConsultaRefactor

class GameTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: .default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        super.tearDown()
    }
    
    func testValidCallToTwitchHTTPStatusCode200() {
        let url = URL(string: "https://api.twitch.tv/kraken/games/top?limit=25")
        let promise = expectation(description: "Status code: 200")
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    print("Status Code: \(statusCode)")
                    promise.fulfill()
                } else {
                    XCTFail("Status Code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCallToTwitchCompletes() {
        let url = URL(string: "https://api.twitch.tv/kraken/games/top?limit=25")
        let promise = expectation(description: "Completion Handler Invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    
    
    func testExample() {

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
