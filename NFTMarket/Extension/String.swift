//
//  String.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/06/22.
//

import Foundation
import UIKit
extension String {
    
    func returnAttributedStringWithPurpleText(range: [NSRange]) -> NSAttributedString {
        let regularAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let colorAttribute = [NSAttributedString.Key.foregroundColor :UIColor.purple]
        let attributedSentence = NSMutableAttributedString(string: self, attributes: regularAttribute)
        for range in range {
            attributedSentence.setAttributes(colorAttribute, range: range)
            
        }
        return attributedSentence

    }
}
