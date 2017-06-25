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
        
        public static func getData(showSpinner: Bool = true, completion: @escaping ReturnChargebackOutput) {
            
            let url = URLComposer(path: [.chargeback])
            if showSpinner { API.showSpinner() }
            
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
                API.hideSpinner()
                guard let data = response.data, response.response?.statusCode == 200 else {
                    return completion(nil, ErrorHandler.errorMessageFromResponse(response))
                }
                completion(ChargebackOutput(json: JSON(data)), nil)
            }
        }
        
        public static func performChargebackOperation(input: ChargebackInput, showSpinner: Bool = true, completion: @escaping ReturnBoolOutput) {
            
            let url = URLComposer(path: [.chargeback])
            let parameters = input.toDict
            if showSpinner { API.showSpinner() }
            
            Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                API.hideSpinner()
                guard response.response?.statusCode == 200 else {
                    return completion(false, ErrorHandler.errorMessageFromResponse(response))
                }
                completion(true, nil)
            }
        }
    }
}
