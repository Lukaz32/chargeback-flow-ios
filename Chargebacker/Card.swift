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
        
        public static func setCard(blocked: Bool, showSpinner: Bool, completion: @escaping ReturnBoolOutput) {
            
            let path: Path = blocked ? .card_block : .card_unblock
            let url = URLComposer(path: [path])
            
            if showSpinner { API.showSpinner() }
            
            Alamofire.request(url, method: .post, encoding: JSONEncoding.default).responseJSON { response in
                API.hideSpinner()
                guard response.response?.statusCode == 200 else {
                    return completion(false, ErrorHandler.errorMessageFromResponse(response))
                }
                completion(true, nil)
            }
        }
    }
}
