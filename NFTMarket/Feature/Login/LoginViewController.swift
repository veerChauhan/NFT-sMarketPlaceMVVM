//
//  LoginViewController.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import UIKit

class LoginViewController: ViewController<LoginViewModel> {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loginDelegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func onClickRegister(_ sender: UIButton) {
        viewModel.loginCoordinator?.onTapRegister()
    }
    @IBAction func onClickLogin(_ sender: UIButton) {
        let email = self.emailTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        viewModel.login(with: email, _Password: password)
    }
}

extension LoginViewController: LoginProtocol {
    func didLoginSucessFully(with user: UserInfo) {
        print(user.userEmail)
        print(user.userToken)
    }
    
    func didFailToLogin(with errorMessage: String) {
        print("error ", errorMessage.description)
    }
    
    
}
