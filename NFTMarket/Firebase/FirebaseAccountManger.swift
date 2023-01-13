//
//  FirebaseManager.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 15/06/22.
//

import Foundation
import FirebaseAuth
import Firebase


final class FirebaseAccountManger {
    
    enum FirebaseAPIError: Error, LocalizedError, Equatable {
        
        case passwordLengthError
        case userExistError
        case undefinedError
        case emailEmpty
        case badEmailFormatError
        case userNotExistError(String)
        case invalidPassword
        
        var errorDescription: String {
            switch self {
            case .passwordLengthError:
                return "Password must be 6 charecter long"
            case .userExistError:
                return "Email already exist please sign in "
            case .undefinedError:
                return "Some thing went wrong Please email r.ranjanchn@gmail.com"
            case .emailEmpty:
                return "Please enter a valid Email"
            case .badEmailFormatError:
                return "Please enter a valid Email"
            case .userNotExistError(let email):
                return "Please check your email address, No user exist with email : \(email)"
            case .invalidPassword:
                return "Please enter a valid Password"
            }
        }
    }
    
    
    func registerUser(with _Email: String, _Password: String,
                      completionHandler: @escaping (Result<AuthDataResult, FirebaseAPIError>) -> Void) {
        
        Auth.auth().createUser(withEmail: _Email, password: _Password) { authResult, error in
            
            if let error = error as? NSError {
                print(error.code, " Error code")
                if error.code == 17026 {
                    completionHandler(.failure(.passwordLengthError))
                    return
                }
                if error.code == 17034 {
                    completionHandler(.failure(.emailEmpty))
                }
                if error.code == 17007 {
                    completionHandler(.failure(.userExistError))
                }
            }
            guard let authResult = authResult else {
                completionHandler(.failure(.undefinedError))
                return
            }
            completionHandler(.success(authResult))
            
        }
    }
    
    
    func userLogin(with _Email: String, _Passwod: String,
                   compltionHandler: @escaping(Result<AuthDataResult, FirebaseAPIError>) -> Void) {
        
        Auth.auth().signIn(withEmail: _Email, password: _Passwod) { authResult, error in
         
            if let error = error as? NSError {
                print(error.code, "Error code")
                
                print("error reason", error.description)
                
                if error.code == 17011 {
                    compltionHandler(.failure(.userNotExistError(_Email)))
                }
                if error.code == 17008 {
                    compltionHandler(.failure(.badEmailFormatError))
                }
                if error.code == 17009 {
                    compltionHandler(.failure(.invalidPassword))
                }
            }
            guard let loginResult = authResult else {
                compltionHandler(.failure(.undefinedError))
                return
            }
            compltionHandler(.success(loginResult))
        }
    }
}
