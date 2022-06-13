//
//  TextFieldView.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 14/06/22.
//

import Foundation
import UIKit

@IBDesignable
final class TextFieldView :UIView {
    
    @IBInspectable var cornerRadius: Double {
        get { return Double(self.layer.cornerRadius) }
        set { self.layer.cornerRadius = CGFloat(newValue) }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

