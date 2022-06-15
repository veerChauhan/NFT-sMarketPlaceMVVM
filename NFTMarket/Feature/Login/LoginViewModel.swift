//
//  LoginViewModel.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import Foundation


protocol LoginProtocol: AnyObject {
    func didLoginSucessFully(with user: UserInfo)
    func didFailToLogin(with errorMessage: String)
}

final class LoginViewModel:ViewModelProtocol {
    
    
    weak var loginCoordinator: LoginCoordinator?
    weak var loginDelegate: LoginProtocol?

    init(){
        print("Init")
    }
    func login(with _Email: String, _Password: String) {
        
        do {
            
            try validateLoginRequest(with: _Email, _Password: _Password)
            
            FirebaseManger.sharedManager.userLogin(with: _Email, _Passwod: _Password) { [weak self] loginResult in
                switch loginResult {
                case .success(let result):
                    print(result)
                    let email = result.user.email ?? "empty Email"
                    let userToken = result.user.uid
                    let info = UserInfo(userEmail: email, userToken: userToken)
                    self?.loginDelegate?.didLoginSucessFully(with: info)
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.loginDelegate?.didFailToLogin(with: error.errorDescription)
                }
            }
        }
        catch {
            let error = error as! ValidationError
            print(error.message)
        }
    }
    
    
    func validateLoginRequest(with _Email: String, _Password: String) throws {
        let emailValidator =  Validator(input: _Email, validationType: .email)
        try emailValidator.validatedText()
        let passwordValidator = Validator(input: _Password, validationType: .password)
        try passwordValidator.validatedText()
    }
    
    deinit {
        print("de init")
    }
    
}
