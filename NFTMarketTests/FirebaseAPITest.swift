//
//  FirebaseAPITest.swift
//  NFTMarketTests
//
//  Created by Ravi Ranjan on 15/06/22.
//

import Foundation
import XCTest
@testable import NFTMarket
class FirebaseAPITest: XCTestCase {
    
    let firebasemanagerMock = FirebaseManger.sharedManager
    
    func test_create_api_on_Firebase(){
        
        let email = "test@123"
        let password = "123456"
        firebasemanagerMock.registerUser(with: email, _Password: password)
        
    }
}
