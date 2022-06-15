//
//  SplashViewModel.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import Foundation
final class SplashViewModel: ViewModelProtocol {
    
    weak var cordinator: MainCoordinator?
    
    deinit {
        print("Deinit")
    }

}

