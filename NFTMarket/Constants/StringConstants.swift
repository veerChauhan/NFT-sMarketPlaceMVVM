//
//  StringConstants.swift
//  NFTMarket
//
//  Created by Ravi Ranjan on 13/01/23.
//

import Foundation


protocol StringConstantDescription {
    var description: String {get}
}
enum StringConstants: StringConstantDescription {
    case appName
    case ok
    
    var description: String {
        switch self {
        case .appName:
            return "NFT MarketPlace"
        case .ok:
            return "Ok"
        }
    }
}


