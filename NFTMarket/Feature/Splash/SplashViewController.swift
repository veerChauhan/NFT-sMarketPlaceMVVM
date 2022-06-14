//
//  SplashViewController.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import UIKit

class SplashViewController: ViewController<SplashViewModel> {
    @IBOutlet weak var CollectSelllabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMarketSloganLabel()

    }

    @IBAction func onClickGoToMarketPlace(_ sender: PrimaryButton) {
        viewModel.cordinator?.login()
    }
    
    func setupMarketSloganLabel() {
        let text = "Collect and Sell Digital Arts"
        self.CollectSelllabel.attributedText = text.returnAttributedStringWithPurpleText(range: [NSRange(location: 0, length: 7),NSRange(location: 12, length: 5)])
    }
}


