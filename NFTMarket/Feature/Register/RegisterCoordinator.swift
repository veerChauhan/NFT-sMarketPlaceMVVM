//
//  RegisterCoordinator.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 15/06/22.
//

import Foundation
import UIKit
protocol RegisterRouter {
    func onTapBack()
}

typealias RegisterRouterCoordinator = RegisterRouter & Coordinator

class RegisterCoordinator:RegisterRouterCoordinator {
    func onTapBack() {
        parentCoordinator?.childDidFinish(self)
        self.navigationController.popViewController(animated: false)
    }
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    weak var parentCoordinator: LoginCoordinator?

    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func configure() {
        let viewModel = RegisterViewModel(accountManager: FirebaseAccountManger())
        let registerScreen = RegisterViewController(viewModel: viewModel)
        registerScreen.viewModel.coordinator = self
        navigationController.pushViewController(registerScreen, animated: false)
    }
}
