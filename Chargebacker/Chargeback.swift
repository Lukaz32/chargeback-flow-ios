//
//  Chargeback.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    public struct Chargeback {
        
        public static func getData(completion: @escaping ReturnChargebackOutput) {
            
            let url = URLComposer(path: [.chargeback])
            
            API.requestForObject(url: url, method: .get, completion: completion)
        }
        
        public static func performChargebackOperation(input: ChargebackInput, completion: @escaping ReturnBoolOutput) {
            
            let url = URLComposer(path: [.chargeback])
            API.requestForBool(url: url, method: .post, parameters: input, completion: completion)
        }
    }
}
