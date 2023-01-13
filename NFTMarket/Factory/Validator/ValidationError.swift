//
//  ValidationError.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/01/23.
//

import Foundation
class ValidationError: Error {
    
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}
