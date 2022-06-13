//
//  AppCoordinator.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 14/06/22.
//

import Foundation
import UIKit
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func configure()
}


class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewModel = SplashViewModel()
        let vc = SplashViewController(viewModel: viewModel)
        vc.cordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func login() {
        let child = LoginCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configure()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

}
