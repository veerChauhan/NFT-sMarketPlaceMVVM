//
//  RegisterViewController.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 15/06/22.
//

import UIKit

class RegisterViewController: ViewController<RegisterViewModel> {
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fullNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.registerDelegate = self
    }

    @IBAction func onClickRegisterButton(_ sender: UIButton) {
        let email = self.emailTF.text ?? ""
        let password = self.passwordTF.text ?? ""
        viewModel.onClickRegister(email: email, password: password)
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        viewModel.coordinator?.onTapBack()
        
    }
}
        
extension RegisterViewController : RegisterUserProtocol{
    
    func didRegisterUser(with UserInfo: UserInfo) {
        print(UserInfo.userToken)
        print(UserInfo.userEmail)
    }
    
    func didFailUserRegister(with message: String) {
        print(message)
    }
    
    
}
