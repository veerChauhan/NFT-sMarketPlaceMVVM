//
//  ViewController.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 14/06/22.
//

import UIKit

class ViewController<T>: UIViewController {
    
    var viewModel: T
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
