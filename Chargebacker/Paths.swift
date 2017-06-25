//
//  Paths.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation

internal enum Path {
    case query(String)
    case notice
    case chargeback
    case card_block
    case card_unblock
    
    func getPath() -> String {
        switch self {
        case let .query(value):
            return "\(value)"
        default:
            return "\(self)"
        }
        
    }
}
