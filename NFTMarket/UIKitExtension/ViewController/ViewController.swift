//
//  ViewController.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 14/06/22.
//

import UIKit

class ViewController<ViewModelProtocol>: UIViewController, UITextFieldDelegate {
    
    var viewModel: ViewModelProtocol
    override func viewDidLoad() {
        super.viewDidLoad()

        view.keyboardLayoutGuide.followsUndockedKeyboard = true

        // Do any additional setup after loading the view.
    }
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        return true
    }
}
