//
//  SplashCoordinator.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 15/06/22.
//

import Foundation
import UIKit
protocol SplashRouter {
    func login()
}

typealias SplashRouterCoordinator = Coordinator & SplashRouter

class MainCoordinator: SplashRouterCoordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewModel = SplashViewModel()
        let vc = SplashViewController(viewModel: viewModel)
        vc.viewModel.cordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func login() {
        let child = LoginCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configure()
    }

}
