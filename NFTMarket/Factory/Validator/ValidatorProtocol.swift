//
//  ValidatorProtocol.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 16/06/22.
//

import Foundation


class Validator {
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
enum ValidatorType {
    case email
    case password
    case username
    case mobile
    case requiredField(field: String)
}

class ValidationError: Error {
    
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertibleProtocol {
    
    func validated(_ value: String) throws
}

class EmailValidator: ValidatorConvertibleProtocol {
    
    func validated(_ value: String) throws {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Please enter a valid email address")
            }
        } catch {
            throw ValidationError("Please enter a valid email address")
        }
    }
}

class PasswordValidator : ValidatorConvertibleProtocol {
    func validated(_ value: String) throws {
        guard value != "" else {throw ValidationError("Password is Required.")}
        guard value.count >= 6 else { throw ValidationError("Password must have at least 6 characters.") }
        
        do {
            if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
            }
        } catch {
            throw ValidationError("Password must be more than 6 characters, with at least one character and one numeric character.")
        }
    }
    
    
}
class UserNameValidator: ValidatorConvertibleProtocol {
    func validated(_ value: String) throws {
        
    }
    
    
}
class MobileNumberValidator: ValidatorConvertibleProtocol {
    func validated(_ value: String) throws {
        
    }
    
    
}

class RequiredFieldValidator:ValidatorConvertibleProtocol {
    
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    func validated(_ value: String) throws {
        guard !value.isEmpty else {
            throw ValidationError("Required field " + fieldName)
        }
    }
    
    
}

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
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
        }
    }
}
