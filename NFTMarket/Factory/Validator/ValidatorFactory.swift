//
//  ValidatorFactory.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/01/23.
//

import Foundation
enum ValidatorFactory {
    
    static func validate(with _type: ValidatorType) -> ValidatorConvertibleProtocol {
        switch _type {
            
        case .email:
            return EmailValidator()
        case .password:
            return PasswordValidator()
        case .username:
            return UserNameValidator()
        case .mobile:
            return MobileNumberValidator()
        case .requiredField(let fieldName):
            return RequiredFieldValidator(fieldName)
        case .matchField(fieldName: let fieldName, secoundField: let secoundField):
            return MatchFieldValidator(fieldName, secoundField)
        }
    }
}
