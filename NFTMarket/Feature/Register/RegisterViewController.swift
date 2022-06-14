//
//  RegisterViewController.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 15/06/22.
//

import UIKit

class RegisterViewController: ViewController<RegisterViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onClickBack(_ sender: UIButton) {
        viewModel.coordinator?.onTapBack()
    }
}
