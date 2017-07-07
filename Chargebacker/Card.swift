//
//  Card.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    public struct Card {
        
        public static func setCard(blocked: Bool, completion: @escaping ReturnBoolOutput) {
            
            let path: Path = blocked ? .card_block : .card_unblock
            let url = URLComposer(path: [path])
            
            API.requestForBool(url: url, method: .post, completion: completion)
        }
    }
}
