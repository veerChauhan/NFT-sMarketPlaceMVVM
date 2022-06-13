//
//  LoginRouter.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func configure() {
        let viewmodel = LoginViewModel()
        let vc = LoginViewController(viewModel: viewmodel)
        vc.loginCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
}
