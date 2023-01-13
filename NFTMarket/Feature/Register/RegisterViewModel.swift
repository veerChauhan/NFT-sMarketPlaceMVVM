//
//  RegisterViewModel.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 15/06/22.
//

import Foundation

protocol RegisterUserPresenterProtocol: AnyObject {
    func didRegisterUser(with UserInfo: UserInfo)
    func didFailUserRegister(with message: String)
}


protocol RegisterViewModelInteractorProtocol: ViewModelProtocol {
    func onClickRegister(email: String, password: String, confirmPassword: String)
    init(accountManager: FirebaseAccountManger )

}


typealias RegisterViewModelProtocols = ViewModelProtocol & RegisterViewModelInteractorProtocol
final class RegisterViewModel:RegisterViewModelProtocols {
    
    weak var registerDelegate: RegisterUserPresenterProtocol?
    weak var coordinator: RegisterCoordinator?
    private var accountManager: FirebaseAccountManger
    init(accountManager: FirebaseAccountManger) {
        self.accountManager = accountManager
    }
    var showIndicator: Bool = false
    
    func onClickRegister(email: String, password: String, confirmPassword: String) {
        
        do {
           try validateRegisterationRequest(with: email, _Password: password, _ConfirmPassword: confirmPassword)
            self.registerUser(email: email, password: password)
        }
        catch (let error){
            let validationError = error as? ValidationError
            self.registerDelegate?.didFailUserRegister(with: validationError?.message ?? "")
        }
    }
    
    
    private func registerUser(email: String, password: String){
        accountManager.registerUser(with: email, _Password: password) { [weak self] registerResult in
            switch registerResult {
            case .success(let result):
                print(result)
                let email = result.user.email ?? "empty Email"
                let userToken = result.user.uid
                let info = UserInfo(userEmail: email, userToken: userToken)
                self?.registerDelegate?.didRegisterUser(with: info)
            case .failure(let error):
                print(error.localizedDescription)
                self?.registerDelegate?.didFailUserRegister(with: error.errorDescription)
            }
        }
    }
    
    private func validateRegisterationRequest(with _Email: String, _Password: String, _ConfirmPassword: String) throws {
        let emailValidator =  Validator(input: _Email, validationType: .email)
        try emailValidator.validatedText()
        let passwordValidator = Validator(input: _Password, validationType: .password)
        try passwordValidator.validatedText()
        let matchPasswordValidator = MatchFieldValidator("Password", _ConfirmPassword)
        try matchPasswordValidator.validated(_Password)
    }
}


struct UserInfo {
    var userEmail: String
    var userToken: String
}
