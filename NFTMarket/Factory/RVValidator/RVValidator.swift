//
//  RVValidator.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 16/06/22.
//

import Foundation


protocol RVValidatorConvertibleProtocol {
    func validated(_ value: String) throws
}

class RVValidator {
    var userInput: String
    var validatorType: ValidatorType
    
    init(input: String, validationType: ValidatorType){
        self.userInput = input
        self.validatorType = validationType
        
    }
    
    func validatedText() throws {
        let factory = ValidatorFactory.validate(with: validatorType)
        try factory.validated(self.userInput)
    }
}



