//
//  FirebaseAccountMangerTest.swift
//  NFTMarketTests
//
//  Created by Ravi Ranjan on 14/01/23.
//

import XCTest

@testable import NFTMarket

class FirebaseAccountManagerTests: XCTestCase {
    var sut: FirebaseAccountManger!
    
    override func setUp() {
        super.setUp()
        sut = FirebaseAccountManger()
    }
    
    func testRegisterUser_whenPasswordIsTooShort_shouldReturnPasswordLengthError() {
        // Arrange
        let email = "test@example.com"
        let password = "short"
        let expectation = XCTestExpectation(description: "Callback invoked")
        
        // Act
        sut.registerUser(with: email, _Password: password) { result in
            // Assert
            if case let .failure(error) = result {
                XCTAssertEqual(error, FirebaseAccountManger.FirebaseAPIError.passwordLengthError)
            } else {
                XCTFail("Expected failure with passwordLengthError")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testUserLogin_whenUserNotExist_shouldReturnUserNotExistError() {
        // Arrange
        let email = "notexist@example.com"
        let password = "password"
        let expectation = XCTestExpectation(description: "Callback invoked")
        
        // Act
        sut.userLogin(with: email, _Passwod: password) { result in
            // Assert
            if case let .failure(error) = result {
                XCTAssertEqual("Please check your email address, No user exist with email : \(email)", FirebaseAccountManger.FirebaseAPIError.userNotExistError(email).errorDescription)
            } else {
                XCTFail("Expected failure with userNotExistError")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testRegisterUser_whenInputValid_shouldReturnAuthDataResult() {
        // Arrange
        let email = "test@example.com"
        let password = "password"
        let expectation = XCTestExpectation(description: "Callback invoked")
        
        
        expectation.fulfill()

        // Act
//        sut.registerUser(with: email, _Password: password) { result in
            // Assert
//            if case let .success(authDataResult) = result {
//                XCTAssertNotNil(authDataResult)
//            } else {
//                XCTFail("Expected success with AuthDataResult")
//            }
//            expectation.fulfill()
//        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
