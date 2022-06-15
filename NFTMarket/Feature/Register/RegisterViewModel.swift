//
//  RegisterViewModel.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 15/06/22.
//

import Foundation

protocol RegisterUserProtocol: AnyObject {
    func didRegisterUser(with UserInfo: UserInfo)
    func didFailUserRegister(with message: String)
}

final class RegisterViewModel:ViewModelProtocol {
    
    weak var registerDelegate: RegisterUserProtocol?
    weak var coordinator: RegisterCoordinator?
    private let firebaseManager = FirebaseManger.sharedManager
    var showIndicator: Bool = false
    
    func onClickRegister(email: String, password: String) {
        
        firebaseManager.registerUser(with: email, _Password: password) { [weak self] registerResult in
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
}


struct UserInfo {
    var userEmail: String
    var userToken: String
}
