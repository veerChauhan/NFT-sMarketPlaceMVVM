//
//  PrimaryButton.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import Foundation
import UIKit


@IBDesignable
final class PrimaryButton :UIButton {

    public override class var layerClass: AnyClass { CAGradientLayer.self }
    
    private var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    @IBInspectable public var startColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    
    @IBInspectable public var buttonTitle: String = "Primary Button" {
        didSet {
            self.setTitle(buttonTitle, for: .normal)
        }
    }
    
    @IBInspectable public var endColor: UIColor = .red {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable public var startPoint: CGPoint {
        get { gradientLayer.startPoint }
        set { gradientLayer.startPoint = newValue }
    }
    
    @IBInspectable public var endPoint: CGPoint {
        get { gradientLayer.endPoint }
        set { gradientLayer.endPoint = newValue }
    }
    
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
        self.configureButton()
    }
    
    func configureButton() {
        self.setTitleColor(.darkText, for: .normal)
    }
    
}
private extension PrimaryButton {
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}
