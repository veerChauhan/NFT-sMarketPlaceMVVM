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

        // Do any additional setup after loading the view.
    }
    @IBAction func onClickRegister(_ sender: UIButton) {
        viewModel.loginCoordinator?.onTapRegister()
    }
}
