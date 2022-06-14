//
//  LoginRouter.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import Foundation
import UIKit

protocol LoginRouter {
    func onTapLogin()
    func onTapRegister()
}

typealias LoginRouterCoordinator = Coordinator & LoginRouter

class LoginCoordinator: LoginRouterCoordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewmodel = LoginViewModel()
        let vc = LoginViewController(viewModel: viewmodel)
        vc.viewModel.loginCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishLogin() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func onTapLogin() {
        
    }
    func onTapRegister(){
        
        let child = RegisterCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configure()
    }
    
}
