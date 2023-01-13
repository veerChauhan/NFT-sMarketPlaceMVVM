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
    }
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func showBasicAlert(with message: String){
        let alertController = UIAlertController(title: StringConstants.appName.description, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: StringConstants.ok.description, style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
