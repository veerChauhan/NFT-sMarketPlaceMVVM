//
//  ValidatorResultFactory.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/01/23.
//

import Foundation

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


class MatchFieldValidator: ValidatorConvertibleProtocol {
    private let fieldName : String
    private let secoundField : String

    init(_ fieldName: String, _ secoundField: String){
        self.fieldName = fieldName
        self.secoundField = secoundField
    }
    func validated(_ value: String) throws {
        
        guard (value == secoundField) else{
            throw ValidationError(fieldName + " does not match")
        }
        
    }
}
